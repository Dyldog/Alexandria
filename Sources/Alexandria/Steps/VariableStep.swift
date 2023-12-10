//
//  VariableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class VariableStep: ValueStep {
    public static var title: String { "Get variable" }
    public var varName: AnyValue
    public var type: VariableTypeValue
    
    public var protoString: String { "{ $\(varName.protoString) }" }
    public var valueString: String { "{ $\(varName.valueString) }" }
    
    public init(varName: AnyValue, type: VariableTypeValue) {
        self.varName = varName
        self.type = type
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return AnyValue(value: StringValue(value: "$0"))
        case .type: return VariableTypeValue(value: .string)
        }
    }

    public func run(with variables: Variables) async throws -> VariableValue {
        let nameValue = try await varName.value(with: variables)
        
        guard let value = await variables.value(for: nameValue.valueString)
        else { throw VariableValueError.valueNotFoundForVariable(varName.protoString) }
        
        return try await value.value(with: variables)
    }
}

extension VariableStep: CodeRepresentable {
    public var codeRepresentation: String {
        varName.codeRepresentation
    }
}
