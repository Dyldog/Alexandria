//
//  FunctionValue.swift
//  
//
//  Created by Dylan Elliott on 17/12/2023.
//

import SwiftUI
import Armstrong

public final class FunctionValue: CompositeEditableVariableValue, ObservableObject {
    public static var type: VariableType { .function }
    
    public var arguments: TypedValue<DictionaryValue> { didSet { objectWillChange.send() } }
    public var body: TypedValue<StepArray> { didSet { objectWillChange.send() } }
    
    public init(arguments: TypedValue<DictionaryValue>, body: TypedValue<StepArray>) {
        self.arguments = arguments
        self.body = body
    }
    
    public convenience init(value steps: [any StepType]) {
        self.init(
            arguments: .value(.makeDefault()), 
            body: .value(.init(value: steps))
        )
    }
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .arguments: return TypedValue.value(DictionaryValue.makeDefault())
        case .body: return TypedValue.value(StepArray.makeDefault())
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.wrongTypeForOperation
    }
    
    public var protoString: String { "(\(arguments.protoString)) -> \(body.protoString)" }
    
    public var valueString: String { "(\(arguments.valueString)) -> \(body.valueString)" }
    
    public func value(with variables: Variables) async throws -> VariableValue {
        try await FunctionValue(
            arguments: .value(arguments.value(with: variables)),
            body: .value(body.value(with: variables))
        )
    }
    
    public func run(with variables: Variables) async throws {
        let funcVariables = variables
        let args: DictionaryValue = try await arguments.value(with: funcVariables)
        for arg in args.elements {
            await funcVariables.set(
                try await arg.value.value(with: funcVariables),
                for: try arg.key.value(with: funcVariables).valueString
            )
        }
        let body: StepArray = try await body.value(with: funcVariables)
        try await  body.run(with: funcVariables)
        
        await variables.set(await funcVariables.value(for: "$0") ?? NilValue(), for: "$0")
    }
}

extension FunctionValue: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}
