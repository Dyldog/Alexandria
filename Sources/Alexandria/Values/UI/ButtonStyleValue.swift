//
//  ButtonStyleValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong

public enum ButtonStyle: String, PickableValue {
    case plain
    case borderedProminent
    case bordered
    
    public static var defaultValue: ButtonStyle = .plain
    
    public var title: String { rawValue }
    
    public var style: any PrimitiveButtonStyle {
        switch self {
        case .plain: return .plain
        case .borderedProminent: return .borderedProminent
        case .bordered: return .bordered
        }
    }
    
    public var codeRepresentation: String {
        switch self {
        case .plain: return ".plain"
        case .borderedProminent: return ".borderedProminent"
        case .bordered: return ".bordered"
        }
    }
}
