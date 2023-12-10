//
//  ForEachStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI
import Armstrong

public final class ForEachStep: Step {
    
    public static var type: VariableType { .forEachStep }
    public static var title: String { "Loop over an array of values" }
    public var values: TypedValue<ArrayValue>
    public var loop: StepArray
    
    public var protoString: String { "FOR VALUE in $\(values.protoString):\n\t\(loop.protoString)" }
    public var valueString: String { "FOR VALUE in $\(values.valueString):\n\t\(loop.valueString)" }

    public init(values: TypedValue<ArrayValue>, loop: StepArray) {
        self.values = values
        self.loop = loop
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .values: return TypedValue.value(ArrayValue(type: .string, elements: []))
        case .loop: return StepArray(value: [])
        }
    }
    
    public func run(with variables: Variables) async throws {
        for value in loop.value {
            let value = try await value.value(with: variables)
            await variables.set(value, for: "$INPUT")
            try await loop.run(with: variables)
        }
    }
}

extension ForEachStep {
    public var codeRepresentation: String {
        "TODO"
    }
}


