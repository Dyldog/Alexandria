//
//  MakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

// sourcery: skipCopying, skipVariableType, skipCodable
public typealias MakeableListRow = MakeableView & Codable

// sourcery: variableTypeName = "listView"
public final class MakeableList: MakeableView {
    
    public static var type: VariableType { .listView }
    
    public var protoString: String { data.protoString }
    public var valueString: String { data.valueString }
        
    public var data: TypedValue<ArrayValue>
    public var view: AnyMakeableView
    
    public init(data: TypedValue<ArrayValue>, view: AnyMakeableView) {
        self.data = data
        self.view = view
    }
    
    public func insertValues(into variables: Variables) throws { }
    
    public func add(_ other: VariableValue) throws -> VariableValue { fatalError() }

    public func value(with variables: Variables) async throws -> VariableValue { self }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .data: return TypedValue(value: .constant(ArrayValue(type: .string, elements: [])))
        case .view: return MakeableLabel.makeDefault().any
        }
    }
    
    public func protoViews() -> [any MakeableView] {
        switch data.value {
        case let .constant(array): 
            return array.elements.map { _ in view.value }
        case .variable:
            return [view.value]
        case .result:
            return [view.value]
        }
    }
    
    public func valueViews(with variables: Variables) async throws -> [any MakeableView] {
        var views: [any MakeableView] = []
        
        let elements = try await data.value.value(with: variables).elements
        for data in elements  {
            let variables = await variables.copy()
            
            let value = try await data.value(
                with: variables
            )
            
            await variables.set(value, for: "$0")
            
            let valueView: any MakeableView = try await view.value(with: variables)
            
            views.append(valueView)
        }
        
        return views
    }
}

public struct MakeableListView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let listView: MakeableList
    
    let onContentUpdate: (MakeableList) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var views: [any MakeableView] = []
    
    public init(isRunning: Bool, showEditControls: Bool, listView: MakeableList, onContentUpdate: @escaping (MakeableList) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.listView = listView
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = .init()
        self._error = error
    }
    
    public var body: some View {
        VStack {
            ForEach(enumerated: views) { index, view in
                MakeableWrapperView(
                    isRunning: isRunning,
                    showEditControls: showEditControls,
                    view: view,
                    onContentUpdate: {
                        views[index] = $0
                    },
                    onRuntimeUpdate: { completion in
                        onRuntimeUpdate {
                            completion()
                        }
                    },
                    error: $error
                )
            }
        }.task(id: variables.hashValue) {
            do {
                if isRunning {
                    views = try await listView.valueViews(with: variables)
                } else {
                    views = listView.protoViews()
                }
                
                if views.isEmpty {
                    views = [MakeableLabel.withText("LIST")]
                }
            } catch let error as VariableValueError {
                self.error = error
                views = [MakeableLabel.withText("ERR")]
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        .listStyle(.plain)
            .any
    }
}

extension MakeableList: CodeRepresentable {
    public var codeRepresentation: String {
        """
        List {
            ForEach(enumerated: \(data.codeRepresentation)) { (index, element) in
                \(view.codeRepresentation.replacingOccurrences(of: "$0", with: "element"))
            }
        }
        """
    }
}
