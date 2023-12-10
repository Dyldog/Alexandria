//
//  StaticValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class StaticValueStep: ValueStep {
    public static var title: String { "Static value" }
    public var value: AnyValue
    
    public var protoString: String { value.protoString }
    public var valueString: String { value.valueString }
    
    public init(value: AnyValue) {
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return Variable(value: StringValue(value: "TEXT"))
        }
    }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        return try await value.value(with: variables)
    }
}

extension StaticValueStep {
    public var codeRepresentation: String {
        value.valueString
    }
}
