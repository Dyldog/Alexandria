//
//  ArrayValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI
import Armstrong

public final class ArrayValueStep: ValueStep {
    
    public static var type: VariableType { .arrayStep }
    public static var title: String { "Get value from array" }
    
    public var protoString: String { "\(array.protoString)[\(index.protoString)]"}
    public var valueString: String { "\(array.valueString)[\(index.valueString)]"}
    
    public var array: AnyValue
    public var index: AnyValue
    
    public init(array: AnyValue, index: AnyValue) {
        self.array = array
        self.index = index
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .array: return AnyValue(value: Variable(value: StringValue(value: "$0")))
        case .index: return AnyValue(value: IntValue(value: 0))
        }
    }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        guard
            let index = try await index.value(with: variables) as? IntValue,
            let array = try await array.value(with: variables) as? ArrayValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        guard let value = array.elements[safe: index.value] else {
            throw VariableValueError.valueNotFoundForVariable(index.protoString)
        }
        
        return value
    }
}

extension ArrayValueStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(array.codeRepresentation)[\(index.codeRepresentation)]"
    }
}
