//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class APIValueStep: ValueStep {
    public static var title: String { "Get value from API" }
    public var url: AnyValue
    
    public var protoString: String { "{ $\(url.protoString) }" }
    public var valueString: String { "{ $\(url.valueString) }" }
    
    public init(url: AnyValue) {
        self.url = url
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .url: return AnyValue(value: StringValue(value: "https://swapi.dev/api/people/1"))
        }
    }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        let value = try await url.value(with: variables)
        
        guard
            let url = URL(string: value.valueString)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return StringValue(value: try String(contentsOf: url))
    }
}

extension APIValueStep: CodeRepresentable {
    public var codeRepresentation: String {
        "try! String(contentsOf: URL(string: \(url.codeRepresentation))!)"
    }
}
