//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class DecodeArrayStep: ValueStep {
    public static var title: String { "Decode an array from JSON" }
    public var value: TypedValue<IntValue>
    
    public var protoString: String { "{ DECODE($\(value.protoString)) }" }
    public var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    public init(value: TypedValue<IntValue>) {
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return TypedValue<IntValue>.variable(.named("$0"))
        }
    }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        let value = try await value.value(with: variables)
        return ArrayValue.from(try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [Any])
    }
}

extension DecodeArrayStep: CodeRepresentable {
    public var codeRepresentation: String {
        "try! JSONSerialization.jsonObject(with: \(value.codeRepresentation).data(using: .utf8)!, options: []) as! [String: Any]"
    }
}
