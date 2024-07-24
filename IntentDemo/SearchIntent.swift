//
//  SearchIntent.swift
//  IntentDemo
//
//  Created by Jonathan on 7/15/24.
//

import Foundation
import AppIntents

@available(iOS 18, macOS 15, *)
@AssistantIntent(schema: .system.search)
struct SearchAppIntent: ShowInAppSearchResultsIntent {
    static let searchScopes: [StringSearchScope] = [.general]
    
    @Parameter()
    var criteria: StringSearchCriteria
    
    @MainActor
    func perform() async throws -> some IntentResult {
        SearchViewModel.shared.search(with: criteria.term)
        return .result()
    }
    
}
