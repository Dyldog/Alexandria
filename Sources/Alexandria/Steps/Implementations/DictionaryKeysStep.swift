//
//  DictionaryKeysStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong

public final class  DictionaryKeysStep: ValueStep {
    
    public static var type: VariableType { .dictionaryKeysStep }
    public static var title: String { "Get all keys from a dictionary" }
    public var dictionary: TypedValue<DictionaryValue>
    
    public init(dictionary: TypedValue<DictionaryValue>) {
        self.dictionary = dictionary
    }
    
    public var protoString: String { "{ \(dictionary.protoString).KEYS }" }
    public var valueString: String { "{ \(dictionary.valueString).KEYS }" }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .dictionary: return TypedValue(value: .constant(DictionaryValue.makeDefault()))
        }
    }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        let dictionary: DictionaryValue = try await dictionary.value(with: variables)
        return ArrayValue(type: .string, elements: Array(dictionary.elements.keys))
    }
}

extension DictionaryKeysStep: CodeRepresentable {
    public var codeRepresentation: String {
        "Array(\(dictionary.codeRepresentation).keys)"
    }
}
