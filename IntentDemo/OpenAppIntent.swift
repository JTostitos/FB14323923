//
//  CreateAppIntent.swift
//  IntentDemo
//
//  Created by Jonathan on 7/15/24.
//


import SwiftUI
import AppIntents

struct OpenAppIntent: AppIntent {
    static let title: LocalizedStringResource = "Open..."
    static let openAppWhenRun: Bool = true
    static let description: IntentDescription? = "Demo Intent compatible with iOS 17"
    
    @MainActor
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
