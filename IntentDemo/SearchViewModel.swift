//
//  SearchViewModel.swift
//  IntentDemo
//
//  Created by Jonathan on 7/15/24.
//

import SwiftUI

@MainActor
@Observable
final class SearchViewModel {
    static public let shared = SearchViewModel()
    
    var searchText = ""
    
    func search(with criteria: String) {
        searchText = criteria
    }
}
