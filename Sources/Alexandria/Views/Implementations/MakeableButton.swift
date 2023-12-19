//
//  MakeableButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

struct MakeableButtonView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let button: MakeableButton
    let onContentUpdate: (MakeableButton) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    init(isRunning: Bool, showEditControls: Bool, button: MakeableButton, onContentUpdate: @escaping (MakeableButton) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.button = button
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._error = error
    }
    var body: some View {
        return SwiftUI.Button(action: {
            runAction()
        }, label: {
            MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: button.title, onContentUpdate: {
                button.title = $0
                onContentUpdate(button)
            }, onRuntimeUpdate: { completion in
                onRuntimeUpdate {
                    completion()
                }
            }, error: $error)
        })
        .buttonStyle(.bordered)
//        .buttonStyle(button.style.value.style)
    }
    
    func runAction() {
        Task { @MainActor in
            if isRunning {
                do {
                    try await button.action.run(with: variables)
                    onRuntimeUpdate { }
                } catch let error as VariableValueError {
                    self.error = error
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

public final class MakeableButton: MakeableView, Codable {
    public static var type: VariableType { .button }
    
    public let id: UUID
    
    @Published public var title: MakeableLabel
    @Published public var style: ButtonStyleValue
    @Published public var action: FunctionValue
    
    public var protoString: String { "BUTTON(\(title.protoString))" }
    public var valueString: String { title.valueString }
    
    public init(id: UUID, title: MakeableLabel, style: ButtonStyleValue, action: FunctionValue) {
        self.id = id
        self.title = title
        self.style = style
        self.action = action
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    public func value(with variables: Variables) async throws -> VariableValue {
        try await MakeableButton(
            id: id,
            title: title.value(with: variables),
            style: style.value(with: variables),
            action: action.value(with: variables)
        )
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .title: return MakeableLabel.makeDefault()
        case .action: return FunctionValue.makeDefault()
        case .style: return ButtonStyleValue(value: .bordered)
        }
    }
    
    public func insertValues(into variables: Variables) throws {
        //
    }
}

extension MakeableButton: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
//        """
//        Button {
//            \(action.body.map { "\t" + $0.codeRepresentation }.joined(separator: "\n"))
//        } label: {
//            \(title.codeRepresentation)
//        }
//        .buttonStyle(\(style.codeRepresentation))
//        """
    }
}
