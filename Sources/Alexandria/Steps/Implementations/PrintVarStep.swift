//
//  PrintVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class PrintVarStep: Step, Codable {
    public static var type: VariableType { .printVarStep }

    public static var title: String { "Print variable" }
    public var varName: AnyValue
    
    public var protoString: String { "{ print($\(varName.protoString)) }"}
    public var valueString: String { "{ print($\(varName.valueString)) }"}
    
    public required init(varName: AnyValue) {
        self.varName = varName
    }
    
    public func run(with variables: Variables) async throws {
        let value = try await varName.value(with: variables)
        print("\(varName.valueString): \(value.valueString)")
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return AnyValue(value: Variable(value: StringValue(value: "$0").any))
        }
    }
}

extension PrintVarStep: CodeRepresentable {
    public var codeRepresentation: String {
        "print(\(varName.codeRepresentation)"
    }
}