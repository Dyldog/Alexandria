//
//  OptionalValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong

public final class OptionalValue: EditableVariableValue {
    
    public static var type: VariableType { .optional }
    
    public var protoString: String { "\(value.protoString)?" }
    public var valueString: String { "\(value.valueString)?"}
    
    public var value: AnyValue
    
    public init(value: AnyValue) {
        self.value = value
    }
    
    public static func makeDefault() -> OptionalValue {
        .init(value: AnyValue(value: NilValue()))
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        try value.add(other)
    }
    
    public func editView(scope: Scope, title: String, onUpdate: @escaping (OptionalValue) -> Void) -> AnyView {
        value.editView(scope: scope, title: title) {
            self.value = $0
            onUpdate(self)
        }
    }
    
    public func value(with variables: Variables) async throws -> VariableValue {
        if let value = try? await value.value(with: variables) {
            return value
        } else {
            return NilValue()
        }
    }
}

extension OptionalValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value.codeRepresentation)?"
    }
}
