//
//  ComparisonValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import Foundation
import Armstrong

public final class ComparisonValue: CompositeEditableVariableValue {
    
    public static var type: VariableType { .comparison }
    
    public var protoString: String { "\(lhs.protoString) \(comparison.protoString) \(rhs.protoString)" }
    public var valueString: String  { "\(lhs.valueString) \(comparison.valueString) \(rhs.valueString)" }
    
    public var lhs: AnyValue
    public var rhs: AnyValue
    public var comparison: ComparisonTypeValue
    
    public init(lhs: AnyValue, rhs: AnyValue, comparison: ComparisonTypeValue) {
        self.lhs = lhs
        self.rhs = rhs
        self.comparison = comparison
    }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .lhs: return AnyValue(value: StringValue(value: "A"))
        case .rhs: return AnyValue(value: StringValue(value: "B"))
        case .comparison: return ComparisonTypeValue(value: .equals)
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparison, "add")
    }
    
    public func value(with variables: Variables) async throws -> VariableValue {
        comparison.compare(
            lhs: try await lhs.value(with: variables),
            rhs: try await rhs.value(with: variables)
        )
    }
}

extension ComparisonValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(lhs.codeRepresentation) \(comparison.codeRepresentation) \(rhs.codeRepresentation)"
    }
}