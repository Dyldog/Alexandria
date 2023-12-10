// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



public class Alexandria: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        APIValueStep.self,
        AddToVarStep.self,
        ArrayValueStep.self,
        DecodeArrayStep.self,
        DecodeDictionaryStep.self,
        DictionaryKeysStep.self,
        DictionaryValueForKeyStep.self,
        ForEachStep.self,
        FunctionStep.self,
        GetNumberStep.self,
        IfStep.self,
        MapStep.self,
        PrintVarStep.self,
        StaticValueStep.self,
        URLEncodeStep.self,
        VariableStep.self
    ]
    }
    public static var values: [any EditableVariableValue.Type] {
    [
    APIValueStep.self,
    AddToVarStep.self,
    AnyMakeableView.self,
    AnyValue.self,
    ArrayValue.self,
    ArrayValueStep.self,
    BoolValue.self,
    ColorValue.self,
    ComparisonTypeValue.self,
    ComparisonValue.self,
    ConditionalActionValue.self,
    DecodeArrayStep.self,
    DecodeDictionaryStep.self,
    DictionaryKeysStep.self,
    DictionaryValue.self,
    DictionaryValueForKeyStep.self,
    ForEachStep.self,
    FunctionStep.self,
    GetNumberStep.self,
    IfStep.self,
    LocationValue.self,
    MakeableArray.self,
    MakeableBase.self,
    MakeableButton.self,
    MakeableField.self,
    MakeableLabel.self,
    MakeableList.self,
    MakeableMap.self,
    MakeableToggle.self,
    MapStep.self,
    NilValue.self,
    NumericalOperationTypeValue.self,
    NumericalOperationValue.self,
    OptionalValue.self,
    PrintVarStep.self,
    ResultValue.self,
    StaticValueStep.self,
    StepArray.self,
    StringValue.self,
    TemporaryValue.self,
    URLEncodeStep.self,
    Variable.self,
    VariableStep.self,
    VariableTypeValue.self,
    FloatValue.self,
    IntValue.self,
    AxisValue.self,
    ButtonStyleValue.self,
    FontWeightValue.self,
    NumericTypeValue.self,
    TextAlignmentValue.self
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    MakeableBase.self,
    MakeableButton.self,
    MakeableField.self,
    MakeableLabel.self,
    MakeableList.self,
    MakeableMap.self,
    MakeableToggle.self
    ]
    }
}

import Armstrong
import DylKit

public enum NumericType: String, Codable, CaseIterable {
    public static var defaultValue: NumericType = .int
    public var title: String { rawValue.capitalized }

    case float
    case int
    public func make(from string: String) throws -> any VariableValue {
        switch self {
        case .float:
            guard let value = Float(string) else { throw VariableValueError.wrongTypeForOperation }
            return FloatValue(value: value)
        case .int:
            guard let value = Int(string) else { throw VariableValueError.wrongTypeForOperation }
            return IntValue(value: value)
        }
    }
}

extension NumericType: CodeRepresentable {
    public var codeRepresentation: String {
        title
    }
}




extension AddViewViewModel {
    convenience init(onSelect: @escaping (any MakeableView) -> Void) {
        self.init(rows: [

            .init(title: "Base", onTap: {
                onSelect(MakeableBase.makeDefault())
            }),

            .init(title: "Button", onTap: {
                onSelect(MakeableButton.makeDefault())
            }),

            .init(title: "Field", onTap: {
                onSelect(MakeableField.makeDefault())
            }),

            .init(title: "Label", onTap: {
                onSelect(MakeableLabel.makeDefault())
            }),

            .init(title: "List", onTap: {
                onSelect(MakeableList.makeDefault())
            }),

            .init(title: "Map", onTap: {
                onSelect(MakeableMap.makeDefault())
            }),

            .init(title: "Toggle", onTap: {
                onSelect(MakeableToggle.makeDefault())
            })
        ])
    }
}




public class Armstrong: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        APIValueStep.self,
        AddToVarStep.self,
        ArrayValueStep.self,
        DecodeArrayStep.self,
        DecodeDictionaryStep.self,
        DictionaryKeysStep.self,
        DictionaryValueForKeyStep.self,
        ForEachStep.self,
        FunctionStep.self,
        GetNumberStep.self,
        IfStep.self,
        MapStep.self,
        PrintVarStep.self,
        StaticValueStep.self,
        URLEncodeStep.self,
        VariableStep.self
    ]
    }
    public static var values: [any EditableVariableValue.Type] {
    [
    APIValueStep.self,
    AddToVarStep.self,
    AnyMakeableView.self,
    AnyValue.self,
    ArrayValue.self,
    ArrayValueStep.self,
    BoolValue.self,
    ColorValue.self,
    ComparisonTypeValue.self,
    ComparisonValue.self,
    ConditionalActionValue.self,
    DecodeArrayStep.self,
    DecodeDictionaryStep.self,
    DictionaryKeysStep.self,
    DictionaryValue.self,
    DictionaryValueForKeyStep.self,
    ForEachStep.self,
    FunctionStep.self,
    GetNumberStep.self,
    IfStep.self,
    LocationValue.self,
    MakeableArray.self,
    MakeableBase.self,
    MakeableButton.self,
    MakeableField.self,
    MakeableLabel.self,
    MakeableList.self,
    MakeableMap.self,
    MakeableToggle.self,
    MapStep.self,
    NilValue.self,
    NumericalOperationTypeValue.self,
    NumericalOperationValue.self,
    OptionalValue.self,
    PrintVarStep.self,
    ResultValue.self,
    StaticValueStep.self,
    StepArray.self,
    StringValue.self,
    TemporaryValue.self,
    URLEncodeStep.self,
    Variable.self,
    VariableStep.self,
    VariableTypeValue.self,
    FloatValue.self,
    IntValue.self,
    AxisValue.self,
    ButtonStyleValue.self,
    FontWeightValue.self,
    NumericTypeValue.self,
    TextAlignmentValue.self
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    MakeableBase.self,
    MakeableButton.self,
    MakeableField.self,
    MakeableLabel.self,
    MakeableList.self,
    MakeableMap.self,
    MakeableToggle.self
    ]
    }
}

import SwiftUI



extension MakeableBase {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableBaseView(isRunning: isRunning, showEditControls: showEditControls, base: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableButton {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, button: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableField {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, field: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableLabel {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableList {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableListView(isRunning: isRunning, showEditControls: showEditControls, listView: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableMap {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableMapView(isRunning: isRunning, showEditControls: showEditControls, map: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableToggle {
    public func make(isRunning: Bool, showEditControls: Bool, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableToggleView(isRunning: isRunning, showEditControls: showEditControls, toggle: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}




public final class AxisValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .axis }
    public static var defaultValue: Axis { .defaultValue }
    public var value: Axis
    public init(value: Axis) {
        self.value = value
    }
    public static func makeDefault() -> AxisValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> AxisValue {
        .init(
            value: value
        )
    }
}

extension AxisValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Axis: Copying {
    public func copy() -> Axis {
        return self
    }
}

extension VariableType {
    static var axis: VariableType { .init() } // Axis
}

public final class ButtonStyleValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .buttonStyle }
    public static var defaultValue: ButtonStyle { .defaultValue }
    public var value: ButtonStyle
    public init(value: ButtonStyle) {
        self.value = value
    }
    public static func makeDefault() -> ButtonStyleValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> ButtonStyleValue {
        .init(
            value: value
        )
    }
}

extension ButtonStyleValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension ButtonStyle: Copying {
    public func copy() -> ButtonStyle {
        return self
    }
}

extension VariableType {
    static var buttonStyle: VariableType { .init() } // ButtonStyle
}

public final class FontWeightValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .fontWeight }
    public static var defaultValue: Font.Weight { .defaultValue }
    public var value: Font.Weight
    public init(value: Font.Weight) {
        self.value = value
    }
    public static func makeDefault() -> FontWeightValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> FontWeightValue {
        .init(
            value: value
        )
    }
}

extension FontWeightValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Font.Weight: Copying {
    public func copy() -> Font.Weight {
        return self
    }
}

extension VariableType {
    static var fontWeight: VariableType { .init() } // Font.Weight
}

public final class NumericTypeValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .numericType }
    public static var defaultValue: NumericType { .defaultValue }
    public var value: NumericType
    public init(value: NumericType) {
        self.value = value
    }
    public static func makeDefault() -> NumericTypeValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> NumericTypeValue {
        .init(
            value: value
        )
    }
}

extension NumericTypeValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension NumericType: Copying {
    public func copy() -> NumericType {
        return self
    }
}

extension VariableType {
    static var numericType: VariableType { .init() } // NumericType
}

public final class TextAlignmentValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .textAlignment }
    public static var defaultValue: TextAlignment { .defaultValue }
    public var value: TextAlignment
    public init(value: TextAlignment) {
        self.value = value
    }
    public static func makeDefault() -> TextAlignmentValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> TextAlignmentValue {
        .init(
            value: value
        )
    }
}

extension TextAlignmentValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension TextAlignment: Copying {
    public func copy() -> TextAlignment {
        return self
    }
}

extension VariableType {
    static var textAlignment: VariableType { .init() } // TextAlignment
}





public final class FloatValue: EditableVariableValue, Codable, Copying, NumericValue {
    public static var type: VariableType { .float }
    public var value: Float
    public static var defaultValue: Float = .defaultValue
    public init(value: Float) {
        self.value = value
    }
    public static func makeDefault() -> FloatValue {
        .init(value: Self.defaultValue)
    }
    public func editView(title: String, onUpdate: @escaping (FloatValue) -> Void) -> AnyView {
        TextField("", text: .init(get: { [weak self] in
            self?.protoString ?? "ERROR"
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = Float($0) ?? self.value
            onUpdate(self)
        })).any
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? FloatValue else { throw VariableValueError.wrongTypeForOperation }
        self.value = self.value + other.value
        return self
    }
    public var protoString: String { "\(value)" }
    public var valueString: String { "\(value)"}
    public func value(with variables: Variables) throws -> VariableValue {
        self
    }
    public func copy() -> FloatValue {
        .init(
            value: value
        )
    }
}

extension FloatValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value)"
    }
}

extension Float: Copying {
    public func copy() -> Float {
        return Float(
        )
    }
}

extension VariableType {
    static var float: VariableType { .init() } // Float
}

public final class IntValue: EditableVariableValue, Codable, Copying, NumericValue {
    public static var type: VariableType { .int }
    public var value: Int
    public static var defaultValue: Int = .defaultValue
    public init(value: Int) {
        self.value = value
    }
    public static func makeDefault() -> IntValue {
        .init(value: Self.defaultValue)
    }
    public func editView(title: String, onUpdate: @escaping (IntValue) -> Void) -> AnyView {
        TextField("", text: .init(get: { [weak self] in
            self?.protoString ?? "ERROR"
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = Int($0) ?? self.value
            onUpdate(self)
        })).any
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? IntValue else { throw VariableValueError.wrongTypeForOperation }
        self.value = self.value + other.value
        return self
    }
    public var protoString: String { "\(value)" }
    public var valueString: String { "\(value)"}
    public func value(with variables: Variables) throws -> VariableValue {
        self
    }
    public func copy() -> IntValue {
        .init(
            value: value
        )
    }
}

extension IntValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value)"
    }
}

extension Int: Copying {
    public func copy() -> Int {
        return Int(
        )
    }
}

extension VariableType {
    static var int: VariableType { .init() } // Int
}




// APIValueStep

extension APIValueStep: Copying {
    public func copy() -> APIValueStep {
        return APIValueStep(
                    url: url.copy() as! AnyValue
        )
    }
}

extension APIValueStep {
     public enum Properties: String, ViewProperty {
        case url
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .url: return APIValueStep.defaultValue(for: .url)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            url: factory(.url) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            url: Properties.url.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .url: return url
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .url: self.url = value as! AnyValue
        }
    }
}

extension VariableType {
    static var aPIStep: VariableType { .init() } // APIValueStep
}

// AddToVarStep

extension AddToVarStep: Copying {
    public func copy() -> AddToVarStep {
        return AddToVarStep(
                    varName: varName.copy() as! AnyValue,
                    value: value.copy() as! AnyValue
        )
    }
}

extension AddToVarStep {
     public enum Properties: String, ViewProperty {
        case varName
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return AddToVarStep.defaultValue(for: .varName)
            case .value: return AddToVarStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    static var addToVarStep: VariableType { .init() } // AddToVarStep
}

// AnyMakeableView

extension AnyMakeableView: Copying {
    public func copy() -> AnyMakeableView {
        return AnyMakeableView(
                    value: value
        )
    }
}


extension VariableType {
    static var view: VariableType { .init() } // AnyMakeableView
}

// AnyValue

extension AnyValue: Copying {
    public func copy() -> AnyValue {
        return AnyValue(
                    value: value
        )
    }
}


extension VariableType {
    static var anyValue: VariableType { .init() } // AnyValue
}

// ArrayValue

extension ArrayValue: Copying {
    public func copy() -> ArrayValue {
        return ArrayValue(
                    type: type,
                    elements: elements
        )
    }
}


extension VariableType {
    static var list: VariableType { .init() } // ArrayValue
}

// ArrayValueStep

extension ArrayValueStep: Copying {
    public func copy() -> ArrayValueStep {
        return ArrayValueStep(
                    array: array.copy() as! AnyValue,
                    index: index.copy() as! AnyValue
        )
    }
}

extension ArrayValueStep {
     public enum Properties: String, ViewProperty {
        case array
        case index
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .array: return ArrayValueStep.defaultValue(for: .array)
            case .index: return ArrayValueStep.defaultValue(for: .index)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            array: factory(.array) as! AnyValue,
            index: factory(.index) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            array: Properties.array.defaultValue as! AnyValue,
            index: Properties.index.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .array: return array
            case .index: return index
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .array: self.array = value as! AnyValue
            case .index: self.index = value as! AnyValue
        }
    }
}

extension VariableType {
    static var arrayStep: VariableType { .init() } // ArrayValueStep
}

// BoolValue

extension BoolValue: Copying {
    public func copy() -> BoolValue {
        return BoolValue(
                    value: value
        )
    }
}


extension VariableType {
    static var boolean: VariableType { .init() } // BoolValue
}

// ColorValue

extension ColorValue: Copying {
    public func copy() -> ColorValue {
        return ColorValue(
                    value: value
        )
    }
}


extension VariableType {
    static var color: VariableType { .init() } // ColorValue
}

// ComparisonTypeValue

extension ComparisonTypeValue: Copying {
    public func copy() -> ComparisonTypeValue {
        return ComparisonTypeValue(
                    value: value
        )
    }
}


extension VariableType {
    static var comparisonType: VariableType { .init() } // ComparisonTypeValue
}

// ComparisonValue

extension ComparisonValue: Copying {
    public func copy() -> ComparisonValue {
        return ComparisonValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    comparison: comparison.copy() as! ComparisonTypeValue
        )
    }
}

extension ComparisonValue {
     public enum Properties: String, ViewProperty {
        case lhs
        case rhs
        case comparison
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .lhs: return ComparisonValue.defaultValue(for: .lhs)
            case .rhs: return ComparisonValue.defaultValue(for: .rhs)
            case .comparison: return ComparisonValue.defaultValue(for: .comparison)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            lhs: factory(.lhs) as! AnyValue,
            rhs: factory(.rhs) as! AnyValue,
            comparison: factory(.comparison) as! ComparisonTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            lhs: Properties.lhs.defaultValue as! AnyValue,
            rhs: Properties.rhs.defaultValue as! AnyValue,
            comparison: Properties.comparison.defaultValue as! ComparisonTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .lhs: return lhs
            case .rhs: return rhs
            case .comparison: return comparison
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .lhs: self.lhs = value as! AnyValue
            case .rhs: self.rhs = value as! AnyValue
            case .comparison: self.comparison = value as! ComparisonTypeValue
        }
    }
}

extension VariableType {
    static var comparison: VariableType { .init() } // ComparisonValue
}

// ConditionalActionValue

extension ConditionalActionValue: Copying {
    public func copy() -> ConditionalActionValue {
        return ConditionalActionValue(
                    ifCondition: ifCondition.copy() as! ComparisonValue,
                    ifSteps: ifSteps.copy() as! StepArray
        )
    }
}

extension ConditionalActionValue {
     public enum Properties: String, ViewProperty {
        case ifCondition
        case ifSteps
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifCondition: return ConditionalActionValue.defaultValue(for: .ifCondition)
            case .ifSteps: return ConditionalActionValue.defaultValue(for: .ifSteps)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifCondition: factory(.ifCondition) as! ComparisonValue,
            ifSteps: factory(.ifSteps) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            ifCondition: Properties.ifCondition.defaultValue as! ComparisonValue,
            ifSteps: Properties.ifSteps.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .ifCondition: return ifCondition
            case .ifSteps: return ifSteps
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .ifCondition: self.ifCondition = value as! ComparisonValue
            case .ifSteps: self.ifSteps = value as! StepArray
        }
    }
}

extension VariableType {
    static var conditionalAction: VariableType { .init() } // ConditionalActionValue
}

// DecodeArrayStep

extension DecodeArrayStep: Copying {
    public func copy() -> DecodeArrayStep {
        return DecodeArrayStep(
                    value: value.copy() as! TypedValue<IntValue>
        )
    }
}

extension DecodeArrayStep {
     public enum Properties: String, ViewProperty {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeArrayStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<IntValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<IntValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! TypedValue<IntValue>
        }
    }
}

extension VariableType {
    static var decodeArrayStep: VariableType { .init() } // DecodeArrayStep
}

// DecodeDictionaryStep

extension DecodeDictionaryStep: Copying {
    public func copy() -> DecodeDictionaryStep {
        return DecodeDictionaryStep(
                    value: value.copy() as! AnyValue
        )
    }
}

extension DecodeDictionaryStep {
     public enum Properties: String, ViewProperty {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeDictionaryStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    static var decodeDictionaryStep: VariableType { .init() } // DecodeDictionaryStep
}

// DictionaryKeysStep

extension DictionaryKeysStep: Copying {
    public func copy() -> DictionaryKeysStep {
        return DictionaryKeysStep(
                    dictionary: dictionary.copy() as! TypedValue<DictionaryValue>
        )
    }
}

extension DictionaryKeysStep {
     public enum Properties: String, ViewProperty {
        case dictionary
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryKeysStep.defaultValue(for: .dictionary)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .dictionary: return dictionary
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
        }
    }
}

extension VariableType {
    static var dictionaryKeysStep: VariableType { .init() } // DictionaryKeysStep
}

// DictionaryValue

extension DictionaryValue: Copying {
    public func copy() -> DictionaryValue {
        return DictionaryValue(
                    type: type.copy() as! VariableTypeValue,
                    elements: elements
        )
    }
}


extension VariableType {
    static var dictionary: VariableType { .init() } // DictionaryValue
}

// DictionaryValueForKeyStep

extension DictionaryValueForKeyStep: Copying {
    public func copy() -> DictionaryValueForKeyStep {
        return DictionaryValueForKeyStep(
                    dictionary: dictionary.copy() as! TypedValue<DictionaryValue>,
                    key: key.copy() as! AnyValue
        )
    }
}

extension DictionaryValueForKeyStep {
     public enum Properties: String, ViewProperty {
        case dictionary
        case key
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryValueForKeyStep.defaultValue(for: .dictionary)
            case .key: return DictionaryValueForKeyStep.defaultValue(for: .key)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>,
            key: factory(.key) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: Properties.key.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .dictionary: return dictionary
            case .key: return key
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
            case .key: self.key = value as! AnyValue
        }
    }
}

extension VariableType {
    static var dictionaryForKeyStep: VariableType { .init() } // DictionaryValueForKeyStep
}

// ForEachStep

extension ForEachStep: Copying {
    public func copy() -> ForEachStep {
        return ForEachStep(
                    values: values.copy() as! TypedValue<ArrayValue>,
                    loop: loop.copy() as! StepArray
        )
    }
}

extension ForEachStep {
     public enum Properties: String, ViewProperty {
        case values
        case loop
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .values: return ForEachStep.defaultValue(for: .values)
            case .loop: return ForEachStep.defaultValue(for: .loop)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            values: factory(.values) as! TypedValue<ArrayValue>,
            loop: factory(.loop) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            values: Properties.values.defaultValue as! TypedValue<ArrayValue>,
            loop: Properties.loop.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .values: return values
            case .loop: return loop
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .values: self.values = value as! TypedValue<ArrayValue>
            case .loop: self.loop = value as! StepArray
        }
    }
}

extension VariableType {
    static var forEachStep: VariableType { .init() } // ForEachStep
}

// FunctionStep

extension FunctionStep: Copying {
    public func copy() -> FunctionStep {
        return FunctionStep(
                    functionName: functionName.copy() as! AnyValue
        )
    }
}

extension FunctionStep {
     public enum Properties: String, ViewProperty {
        case functionName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .functionName: return FunctionStep.defaultValue(for: .functionName)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            functionName: factory(.functionName) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            functionName: Properties.functionName.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .functionName: return functionName
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .functionName: self.functionName = value as! AnyValue
        }
    }
}

extension VariableType {
    static var functionStep: VariableType { .init() } // FunctionStep
}

// GetNumberStep

extension GetNumberStep: Copying {
    public func copy() -> GetNumberStep {
        return GetNumberStep(
                    value: value.copy() as! AnyValue,
                    numberType: numberType
        )
    }
}

extension GetNumberStep {
     public enum Properties: String, ViewProperty {
        case value
        case numberType
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return GetNumberStep.defaultValue(for: .value)
            case .numberType: return GetNumberStep.defaultValue(for: .numberType)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue,
            numberType: factory(.numberType) as! NumericTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue,
            numberType: Properties.numberType.defaultValue as! NumericTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
            case .numberType: return numberType
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
            case .numberType: self.numberType = value as! NumericTypeValue
        }
    }
}

extension VariableType {
    static var getNumberStep: VariableType { .init() } // GetNumberStep
}

// IfStep

extension IfStep: Copying {
    public func copy() -> IfStep {
        return IfStep(
                    ifAction: ifAction.copy() as! ConditionalActionValue,
                    elseAction: elseAction.copy() as! StepArray
        )
    }
}

extension IfStep {
     public enum Properties: String, ViewProperty {
        case ifAction
        case elseAction
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifAction: return IfStep.defaultValue(for: .ifAction)
            case .elseAction: return IfStep.defaultValue(for: .elseAction)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifAction: factory(.ifAction) as! ConditionalActionValue,
            elseAction: factory(.elseAction) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            ifAction: Properties.ifAction.defaultValue as! ConditionalActionValue,
            elseAction: Properties.elseAction.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .ifAction: return ifAction
            case .elseAction: return elseAction
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .ifAction: self.ifAction = value as! ConditionalActionValue
            case .elseAction: self.elseAction = value as! StepArray
        }
    }
}

extension VariableType {
    static var ifStep: VariableType { .init() } // IfStep
}

// LocationValue

extension LocationValue: Copying {
    public func copy() -> LocationValue {
        return LocationValue(
                    name: name.copy() as! TypedValue<StringValue>,
                    latitude: latitude.copy() as! TypedValue<FloatValue>,
                    longitude: longitude.copy() as! TypedValue<FloatValue>
        )
    }
}

extension LocationValue {
     public enum Properties: String, ViewProperty {
        case name
        case latitude
        case longitude
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .name: return LocationValue.defaultValue(for: .name)
            case .latitude: return LocationValue.defaultValue(for: .latitude)
            case .longitude: return LocationValue.defaultValue(for: .longitude)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            name: factory(.name) as! TypedValue<StringValue>,
            latitude: factory(.latitude) as! TypedValue<FloatValue>,
            longitude: factory(.longitude) as! TypedValue<FloatValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            name: Properties.name.defaultValue as! TypedValue<StringValue>,
            latitude: Properties.latitude.defaultValue as! TypedValue<FloatValue>,
            longitude: Properties.longitude.defaultValue as! TypedValue<FloatValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .name: return name
            case .latitude: return latitude
            case .longitude: return longitude
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .name: self.name = value as! TypedValue<StringValue>
            case .latitude: self.latitude = value as! TypedValue<FloatValue>
            case .longitude: self.longitude = value as! TypedValue<FloatValue>
        }
    }
}

extension VariableType {
    static var location: VariableType { .init() } // LocationValue
}

// MakeableArray

extension MakeableArray: Copying {
    public func copy() -> MakeableArray {
        return MakeableArray(
                    value: value,
                    axis: axis
        )
    }
}


extension VariableType {
    static var makeableArray: VariableType { .init() } // MakeableArray
}

// MakeableBase

extension MakeableBase: Copying {
    public func copy() -> MakeableBase {
        return MakeableBase(
                    padding: padding,
                    backgroundColor: backgroundColor.copy() as! ColorValue,
                    cornerRadius: cornerRadius
        )
    }
}

extension MakeableBase {
     public enum Properties: String, ViewProperty {
        case padding
        case backgroundColor
        case cornerRadius
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .padding: return MakeableBase.defaultValue(for: .padding)
            case .backgroundColor: return MakeableBase.defaultValue(for: .backgroundColor)
            case .cornerRadius: return MakeableBase.defaultValue(for: .cornerRadius)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            padding: factory(.padding) as! IntValue,
            backgroundColor: factory(.backgroundColor) as! ColorValue,
            cornerRadius: factory(.cornerRadius) as! IntValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            padding: Properties.padding.defaultValue as! IntValue,
            backgroundColor: Properties.backgroundColor.defaultValue as! ColorValue,
            cornerRadius: Properties.cornerRadius.defaultValue as! IntValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .padding: return padding
            case .backgroundColor: return backgroundColor
            case .cornerRadius: return cornerRadius
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .padding: self.padding = value as! IntValue
            case .backgroundColor: self.backgroundColor = value as! ColorValue
            case .cornerRadius: self.cornerRadius = value as! IntValue
        }
    }
}

extension VariableType {
    static var base: VariableType { .init() } // MakeableBase
}

// MakeableButton

extension MakeableButton: Copying {
    public func copy() -> MakeableButton {
        return MakeableButton(
                    title: title.copy() as! MakeableLabel,
                    style: style,
                    action: action.copy() as! StepArray
        )
    }
}

extension MakeableButton {
     public enum Properties: String, ViewProperty {
        case title
        case style
        case action
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .style: return MakeableButton.defaultValue(for: .style)
            case .action: return MakeableButton.defaultValue(for: .action)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            title: factory(.title) as! MakeableLabel,
            style: factory(.style) as! ButtonStyleValue,
            action: factory(.action) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            title: Properties.title.defaultValue as! MakeableLabel,
            style: Properties.style.defaultValue as! ButtonStyleValue,
            action: Properties.action.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .title: return title
            case .style: return style
            case .action: return action
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .title: self.title = value as! MakeableLabel
            case .style: self.style = value as! ButtonStyleValue
            case .action: self.action = value as! StepArray
        }
    }
}

extension VariableType {
    static var button: VariableType { .init() } // MakeableButton
}

// MakeableField

extension MakeableField: Copying {
    public func copy() -> MakeableField {
        return MakeableField(
                    text: text.copy() as! TemporaryValue,
                    fontSize: fontSize,
                    onTextUpdate: onTextUpdate.copy() as! StepArray,
                    padding: padding,
                    alignment: alignment
        )
    }
}

extension MakeableField {
     public enum Properties: String, ViewProperty {
        case text
        case fontSize
        case onTextUpdate
        case padding
        case alignment
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            case .padding: return MakeableField.defaultValue(for: .padding)
            case .alignment: return MakeableField.defaultValue(for: .alignment)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            text: factory(.text) as! TemporaryValue,
            fontSize: factory(.fontSize) as! IntValue,
            onTextUpdate: factory(.onTextUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue,
            alignment: factory(.alignment) as! TextAlignmentValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            text: Properties.text.defaultValue as! TemporaryValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: Properties.onTextUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue,
            alignment: Properties.alignment.defaultValue as! TextAlignmentValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .text: return text
            case .fontSize: return fontSize
            case .onTextUpdate: return onTextUpdate
            case .padding: return padding
            case .alignment: return alignment
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .text: self.text = value as! TemporaryValue
            case .fontSize: self.fontSize = value as! IntValue
            case .onTextUpdate: self.onTextUpdate = value as! StepArray
            case .padding: self.padding = value as! IntValue
            case .alignment: self.alignment = value as! TextAlignmentValue
        }
    }
}

extension VariableType {
    static var field: VariableType { .init() } // MakeableField
}

// MakeableLabel

extension MakeableLabel: Copying {
    public func copy() -> MakeableLabel {
        return MakeableLabel(
                    text: text.copy() as! AnyValue,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    italic: italic.copy() as! BoolValue,
                    base: base.copy() as! MakeableBase,
                    textColor: textColor.copy() as! ColorValue
        )
    }
}

extension MakeableLabel {
     public enum Properties: String, ViewProperty {
        case text
        case fontSize
        case fontWeight
        case italic
        case base
        case textColor
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableLabel.defaultValue(for: .text)
            case .fontSize: return MakeableLabel.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableLabel.defaultValue(for: .fontWeight)
            case .italic: return MakeableLabel.defaultValue(for: .italic)
            case .base: return MakeableLabel.defaultValue(for: .base)
            case .textColor: return MakeableLabel.defaultValue(for: .textColor)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            text: factory(.text) as! AnyValue,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue,
            base: factory(.base) as! MakeableBase,
            textColor: factory(.textColor) as! ColorValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            text: Properties.text.defaultValue as! AnyValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            fontWeight: Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: Properties.italic.defaultValue as! BoolValue,
            base: Properties.base.defaultValue as! MakeableBase,
            textColor: Properties.textColor.defaultValue as! ColorValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .text: return text
            case .fontSize: return fontSize
            case .fontWeight: return fontWeight
            case .italic: return italic
            case .base: return base
            case .textColor: return textColor
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .text: self.text = value as! AnyValue
            case .fontSize: self.fontSize = value as! IntValue
            case .fontWeight: self.fontWeight = value as! FontWeightValue
            case .italic: self.italic = value as! BoolValue
            case .base: self.base = value as! MakeableBase
            case .textColor: self.textColor = value as! ColorValue
        }
    }
}

extension VariableType {
    static var label: VariableType { .init() } // MakeableLabel
}

// MakeableList

extension MakeableList: Copying {
    public func copy() -> MakeableList {
        return MakeableList(
                    data: data.copy() as! TypedValue<ArrayValue>,
                    view: view.copy() as! AnyMakeableView
        )
    }
}

extension MakeableList {
     public enum Properties: String, ViewProperty {
        case data
        case view
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .data: return MakeableList.defaultValue(for: .data)
            case .view: return MakeableList.defaultValue(for: .view)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            data: factory(.data) as! TypedValue<ArrayValue>,
            view: factory(.view) as! AnyMakeableView
        )
    }

    public static func makeDefault() -> Self {
        .init(
            data: Properties.data.defaultValue as! TypedValue<ArrayValue>,
            view: Properties.view.defaultValue as! AnyMakeableView
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .data: return data
            case .view: return view
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .data: self.data = value as! TypedValue<ArrayValue>
            case .view: self.view = value as! AnyMakeableView
        }
    }
}

extension VariableType {
    static var listView: VariableType { .init() } // MakeableList
}

// MakeableListRow




// MakeableMap

extension MakeableMap: Copying {
    public func copy() -> MakeableMap {
        return MakeableMap(
                    locations: locations.copy() as! TypedValue<ArrayValue>,
                    zoomFollowsNewAnnotations: zoomFollowsNewAnnotations.copy() as! BoolValue
        )
    }
}

extension MakeableMap {
     public enum Properties: String, ViewProperty {
        case locations
        case zoomFollowsNewAnnotations
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .locations: return MakeableMap.defaultValue(for: .locations)
            case .zoomFollowsNewAnnotations: return MakeableMap.defaultValue(for: .zoomFollowsNewAnnotations)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            locations: factory(.locations) as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: factory(.zoomFollowsNewAnnotations) as! BoolValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            locations: Properties.locations.defaultValue as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: Properties.zoomFollowsNewAnnotations.defaultValue as! BoolValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .locations: return locations
            case .zoomFollowsNewAnnotations: return zoomFollowsNewAnnotations
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .locations: self.locations = value as! TypedValue<ArrayValue>
            case .zoomFollowsNewAnnotations: self.zoomFollowsNewAnnotations = value as! BoolValue
        }
    }
}

extension VariableType {
    static var map: VariableType { .init() } // MakeableMap
}

// MakeableToggle

extension MakeableToggle: Copying {
    public func copy() -> MakeableToggle {
        return MakeableToggle(
                    isOn: isOn.copy() as! TemporaryValue,
                    onToggleUpdate: onToggleUpdate.copy() as! StepArray,
                    padding: padding
        )
    }
}

extension MakeableToggle {
     public enum Properties: String, ViewProperty {
        case isOn
        case onToggleUpdate
        case padding
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .isOn: return MakeableToggle.defaultValue(for: .isOn)
            case .onToggleUpdate: return MakeableToggle.defaultValue(for: .onToggleUpdate)
            case .padding: return MakeableToggle.defaultValue(for: .padding)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            isOn: factory(.isOn) as! TemporaryValue,
            onToggleUpdate: factory(.onToggleUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            isOn: Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: Properties.onToggleUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .isOn: return isOn
            case .onToggleUpdate: return onToggleUpdate
            case .padding: return padding
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .isOn: self.isOn = value as! TemporaryValue
            case .onToggleUpdate: self.onToggleUpdate = value as! StepArray
            case .padding: self.padding = value as! IntValue
        }
    }
}

extension VariableType {
    static var toggle: VariableType { .init() } // MakeableToggle
}

// MapStep

extension MapStep: Copying {
    public func copy() -> MapStep {
        return MapStep(
                    value: value.copy() as! TypedValue<ArrayValue>,
                    mapper: mapper.copy() as! StepArray
        )
    }
}

extension MapStep {
     public enum Properties: String, ViewProperty {
        case value
        case mapper
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return MapStep.defaultValue(for: .value)
            case .mapper: return MapStep.defaultValue(for: .mapper)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<ArrayValue>,
            mapper: factory(.mapper) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<ArrayValue>,
            mapper: Properties.mapper.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
            case .mapper: return mapper
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! TypedValue<ArrayValue>
            case .mapper: self.mapper = value as! StepArray
        }
    }
}

extension VariableType {
    static var mapStep: VariableType { .init() } // MapStep
}

// NilValue

extension NilValue: Copying {
    public func copy() -> NilValue {
        return NilValue(
        )
    }
}


extension VariableType {
    static var `nil`: VariableType { .init() } // NilValue
}

// NumericalOperationTypeValue

extension NumericalOperationTypeValue: Copying {
    public func copy() -> NumericalOperationTypeValue {
        return NumericalOperationTypeValue(
                    value: value
        )
    }
}


extension VariableType {
    static var numericalOperationType: VariableType { .init() } // NumericalOperationTypeValue
}

// NumericalOperationValue

extension NumericalOperationValue: Copying {
    public func copy() -> NumericalOperationValue {
        return NumericalOperationValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    operation: operation.copy() as! NumericalOperationTypeValue
        )
    }
}

extension NumericalOperationValue {
     public enum Properties: String, ViewProperty {
        case lhs
        case rhs
        case operation
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .lhs: return NumericalOperationValue.defaultValue(for: .lhs)
            case .rhs: return NumericalOperationValue.defaultValue(for: .rhs)
            case .operation: return NumericalOperationValue.defaultValue(for: .operation)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            lhs: factory(.lhs) as! AnyValue,
            rhs: factory(.rhs) as! AnyValue,
            operation: factory(.operation) as! NumericalOperationTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            lhs: Properties.lhs.defaultValue as! AnyValue,
            rhs: Properties.rhs.defaultValue as! AnyValue,
            operation: Properties.operation.defaultValue as! NumericalOperationTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .lhs: return lhs
            case .rhs: return rhs
            case .operation: return operation
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .lhs: self.lhs = value as! AnyValue
            case .rhs: self.rhs = value as! AnyValue
            case .operation: self.operation = value as! NumericalOperationTypeValue
        }
    }
}

extension VariableType {
    static var numericalOperation: VariableType { .init() } // NumericalOperationValue
}

// OptionalValue

extension OptionalValue: Copying {
    public func copy() -> OptionalValue {
        return OptionalValue(
                    value: value.copy() as! AnyValue
        )
    }
}


extension VariableType {
    static var optional: VariableType { .init() } // OptionalValue
}

// PrintVarStep

extension PrintVarStep: Copying {
    public func copy() -> PrintVarStep {
        return PrintVarStep(
                    varName: varName.copy() as! AnyValue
        )
    }
}

extension PrintVarStep {
     public enum Properties: String, ViewProperty {
        case varName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return PrintVarStep.defaultValue(for: .varName)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
        }
    }
}

extension VariableType {
    static var printVarStep: VariableType { .init() } // PrintVarStep
}

// ResultValue

extension ResultValue: Copying {
    public func copy() -> ResultValue {
        return ResultValue(
                    steps: steps.copy() as! StepArray
        )
    }
}


extension VariableType {
    static var result: VariableType { .init() } // ResultValue
}

// StaticValueStep

extension StaticValueStep: Copying {
    public func copy() -> StaticValueStep {
        return StaticValueStep(
                    value: value.copy() as! AnyValue
        )
    }
}

extension StaticValueStep {
     public enum Properties: String, ViewProperty {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return StaticValueStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    static var staticStep: VariableType { .init() } // StaticValueStep
}

// StepArray

extension StepArray: Copying {
    public func copy() -> StepArray {
        return StepArray(
                    value: value
        )
    }
}


extension VariableType {
    static var stepArray: VariableType { .init() } // StepArray
}

// StringValue

extension StringValue: Copying {
    public func copy() -> StringValue {
        return StringValue(
                    value: value
        )
    }
}


extension VariableType {
    static var string: VariableType { .init() } // StringValue
}

// TemporaryValue

extension TemporaryValue: Copying {
    public func copy() -> TemporaryValue {
        return TemporaryValue(
                    initial: initial.copy() as! AnyValue,
                    output: output.copy() as! Variable
        )
    }
}

extension TemporaryValue {
     public enum Properties: String, ViewProperty {
        case initial
        case output
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .initial: return TemporaryValue.defaultValue(for: .initial)
            case .output: return TemporaryValue.defaultValue(for: .output)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            initial: factory(.initial) as! AnyValue,
            output: factory(.output) as! Variable
        )
    }

    public static func makeDefault() -> Self {
        .init(
            initial: Properties.initial.defaultValue as! AnyValue,
            output: Properties.output.defaultValue as! Variable
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .initial: return initial
            case .output: return output
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .initial: self.initial = value as! AnyValue
            case .output: self.output = value as! Variable
        }
    }
}

extension VariableType {
    static var temporary: VariableType { .init() } // TemporaryValue
}

// TypeableValue




// TypedValue

extension TypedValue: Copying {
    public func copy() -> TypedValue {
        return TypedValue(
                    value: value
        )
    }
}



// URLEncodeStep

extension URLEncodeStep: Copying {
    public func copy() -> URLEncodeStep {
        return URLEncodeStep(
                    value: value.copy() as! AnyValue
        )
    }
}

extension URLEncodeStep {
     public enum Properties: String, ViewProperty {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return URLEncodeStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    static var uRLEncodeStep: VariableType { .init() } // URLEncodeStep
}

// Variable

extension Variable: Copying {
    public func copy() -> Variable {
        return Variable(
                    value: value
        )
    }
}


extension VariableType {
    static var variable: VariableType { .init() } // Variable
}

// VariableStep

extension VariableStep: Copying {
    public func copy() -> VariableStep {
        return VariableStep(
                    varName: varName.copy() as! AnyValue,
                    type: type.copy() as! VariableTypeValue
        )
    }
}

extension VariableStep {
     public enum Properties: String, ViewProperty {
        case varName
        case type
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return VariableStep.defaultValue(for: .varName)
            case .type: return VariableStep.defaultValue(for: .type)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            type: factory(.type) as! VariableTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            type: Properties.type.defaultValue as! VariableTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
            case .type: return type
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
            case .type: self.type = value as! VariableTypeValue
        }
    }
}

extension VariableType {
    static var variableStep: VariableType { .init() } // VariableStep
}

// VariableTypeValue

extension VariableTypeValue: Copying {
    public func copy() -> VariableTypeValue {
        return VariableTypeValue(
                    value: value
        )
    }
}


extension VariableType {
    static var type: VariableType { .init() } // VariableTypeValue
}











