//
//  HideKeyboardExtension.swift
//  ScheduleMyWork
//
//  Created by İsmail on 26.10.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
