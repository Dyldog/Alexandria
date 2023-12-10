//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class AddToVarStep: Step, ObservableObject {
    
    public static var title: String { "Add to variable" }
    public var varName: AnyValue
    public var value: AnyValue
    
    public var protoString: String { "{ $\(varName.protoString) += \(value.protoString) }" }
    public var valueString: String { "{ $\(varName.valueString) += \(value.valueString) }" }
    
    public init(varName: AnyValue, value: AnyValue) {
        self.varName = varName
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: IntValue(value: 1))
        case .varName: return AnyValue(value: Variable(value: StringValue(value: "VAR")))
        }
    }
    
    public func run(with variables: Variables) async throws {
        let varNameValue = try await varName.value(with: variables)
        
        guard let oldValue = await variables.value(for: varNameValue.valueString) else {
            throw VariableValueError.valueNotFoundForVariable(varNameValue.valueString)
        }
        let extraValue = try await value.value(with: variables)
        await variables.set(try oldValue.add(extraValue), for: varName.valueString)
    }
    
    public enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}

extension AddToVarStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(varName.valueString) = \(varName.codeRepresentation) + \(value.codeRepresentation)"
    }
}
