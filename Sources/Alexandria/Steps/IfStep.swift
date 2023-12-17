//
//  IfStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import Foundation
import Armstrong

public final class IfStep: Step {
    
    public static var title: String { "If condition" }
    public static var type: VariableType { .ifStep }
    
    public var ifAction: ConditionalActionValue
    public var elseAction: StepArray
    
    public init(ifAction: ConditionalActionValue, elseAction: StepArray) {
        self.ifAction = ifAction
        self.elseAction = elseAction
    }
    
    public var protoString: String { """
    \(ifAction.protoString)
    else:\n\t\(elseAction.protoString)
    """ }
    
    public var valueString: String { """
    \(ifAction.valueString)
    else:\n\t\(elseAction.valueString)
    """ }
    
    public func run(with variables: Variables) async throws {
        let ifValue: StepArray = try await ifAction.value(with: variables)
        if !ifValue.value.isEmpty {
            try await ifValue.run(with: variables)
        } else {
            try await elseAction.run(with: variables)
        }
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifAction: return ConditionalActionValue.makeDefault()
        case .elseAction: return StepArray.makeDefault()
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension IfStep {
    public var codeRepresentation: String {
        """
        \(ifAction.codeRepresentation) else {
            \(elseAction.codeRepresentation)
        }
        """
    }
}
