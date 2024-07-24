//
//  SnippetsShortcuts.swift
//  IntentDemo
//
//  Created by Jonathan on 7/15/24.
//


import Foundation
import AppIntents

struct SnippetsShortcuts: AppShortcutsProvider {
    
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        //iOS 17+ Intent
        AppShortcut(intent: OpenAppIntent(), phrases: [
            "Open \(.applicationName)"
        ], shortTitle: "Open App", systemImageName: "square")
        
        //iOS 18+ Intent.
        //Even without this being in the AppShortcutsProvider, the app will still crash on 17.4 up to 18. Just simply having the AssistantIntent macro in the project will prevent it from running on 17.4 up to 18.
        if #available(iOS 18, macOS 15, *) {
            AppShortcut(intent: SearchAppIntent(), phrases: [
                "Search \(.applicationName)"
            ], shortTitle: "Search", systemImageName: "magnifyingglass")
        }
    }
    
    let shortcutTileColor: ShortcutTileColor = .blue
}
