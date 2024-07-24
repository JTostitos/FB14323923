//
//  ContentView.swift
//  IntentDemo
//
//  Created by Jonathan on 7/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchVM: SearchViewModel = SearchViewModel.shared
    
    let runtimeError: String = """
    dyld[21935]: Symbol not found: _$s10AppIntents15AssistantSchemaV06IntentD0VAC0E0AAWP
      Referenced from: <F7A1FEF0-F3B0-379C-A914-D1FB0BA7C693> /Users/jonathan/Library/Developer/CoreSimulator/Devices/CA308F47-BCA8-4429-8599-1BB1CCEAB5B6/data/Containers/Bundle/Application/D7DC8E16-90DB-406A-A521-20F18326E4A7/IntentDemo.app/IntentDemo.debug.dylib
      Expected in:     <88E18E38-24EC-364E-94A1-E7922AD247AF> /Library/Developer/CoreSimulator/Volumes/iOS_21F79/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 17.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks/AppIntents.framework/AppIntents
    """
    
    var body: some View {
        NavigationStack {
            List {
                Text("Hello Apple Feedback Team!")
                Text("Try to run this project on iOS 17.4 or newer. The app will crash due to @AssistantIntent being only available on iOS 18, even though the SearchIntent struct is marked with @available.")
                Text("The app runs just fine on iOS 18 though.")
                
                NavigationLink("Runtime Error", value: runtimeError)
            }
            .searchable(text: $searchVM.searchText, placement: .navigationBarDrawer)
            .searchPresentationToolbarBehavior(.avoidHidingContent)
            .navigationDestination(for: String.self) { string in
                ScrollView {
                    Text(string)
                        .scenePadding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
