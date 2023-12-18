//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

struct MakeableFieldView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let field: MakeableField
    let onContentUpdate: (MakeableField) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    @State var text: String = "LOADING"
    
    private var fieldView: some View {
        let binding: Binding<String> = .init(get: {
            text
        }, set: {
            onTextUpdate($0)
        })
        
        if field.isMultiline.value {
            return TextEditor(text: binding).any
        } else {
            return TextField("", text: binding).any
        }
    }
    var body: some View {
        VStack {
            if isRunning {
                fieldView
                .multilineTextAlignment(field.alignment.value)
                .font(.system(size: CGFloat(field.fontSize.value))).any
            } else {
                Text(field.protoString)
                    .font(.system(size: CGFloat(field.fontSize.value)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .any
            }
        }.task(id: variables.hashValue) {
            await updateValues()
        }
    }
    
    private func updateValues() async  {
        do {
            let value = try await field.text.value(with: variables).valueString
            self.text = value
        } catch let error as VariableValueError {
            self.error = error
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func onTextUpdate(_ string: String) {
        guard self.text != string else { return }
        self.text = string
        
        Task { @MainActor in
            do {
                if isRunning {
                    let outputVar = try await field.text.output.value.value(with: variables)
                    variables.set(AnyValue(value: StringValue(value: string)), for: outputVar.valueString)
                    try await field.onTextUpdate.run(with: variables)
                }
            } catch let error as VariableValueError {
                self.error = error
            } catch {
                print(error.localizedDescription)
            }
            
            onRuntimeUpdate {
                Task { @MainActor in await updateValues() }
            }
        }
    }
}

public final class MakeableField: MakeableView, Codable {
    
    public static var type: VariableType { .field }
    public var text: TemporaryValue
    public var fontSize: IntValue
    public var onTextUpdate: StepArray
    public var padding: IntValue
    public var alignment: TextAlignmentValue
    public var isMultiline: BoolValue
    
    public init(text: TemporaryValue, fontSize: IntValue, onTextUpdate: StepArray, padding: IntValue, alignment: TextAlignmentValue, isMultiline: BoolValue) {
        self.text = text
        self.fontSize = fontSize
        self.onTextUpdate = onTextUpdate
        self.padding = padding
        self.alignment = alignment
        self.isMultiline = isMultiline
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return TemporaryValue.makeDefault()
        case .fontSize: return IntValue(value: 18)
        case .onTextUpdate: return StepArray(value: [])
        case .padding: return IntValue(value: 5)
        case .alignment: return TextAlignmentValue(value: .center)
        case .isMultiline: return BoolValue.false
        }
    }
    
    public var protoString: String { text.protoString }
    public var valueString: String { text.valueString }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    public func value(with variables: Variables) async throws -> VariableValue {
//        self
        try await MakeableField(
            text: TemporaryValue(
                initial: (text.value(with: variables) as (any EditableVariableValue)).any,
                output: text.output
            ),
            fontSize: fontSize.value(with: variables),
            onTextUpdate: onTextUpdate.value(with: variables),
            padding: padding.value(with: variables),
            alignment: alignment.value(with: variables),
            isMultiline: isMultiline.value(with: variables)
        )
    }
    
    public func insertValues(into variables: Variables) async throws {
        let outputVarName = try await text.output.value.value(with: variables)
        let outputValue = try await text.value(with: variables)
        await variables.set(outputValue, for: outputVarName.valueString)
        try await onTextUpdate.run(with: variables)
    }
}

extension MakeableField: CodeRepresentable {
    public var codeRepresentation: String {
        """
        TextField("", text: .init(get: {
            \(text.codeRepresentation)
        }, set: {
            // TODO
        }))
        .multilineTextAlignment(\(alignment.codeRepresentation)
        .font(.system(size: \(fontSize.value))
        """
    }
}