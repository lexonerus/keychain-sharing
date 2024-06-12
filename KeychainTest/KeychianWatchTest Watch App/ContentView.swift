//
//  ContentView.swift
//  KeychianWatchTest Watch App
//
//  Created by Alexey Krzywicki on 11.06.2024.
//

import SwiftUI
import KeychainAccess

struct ContentView: View {
    @State private var textFromKeychain: String = "Loading..."
    let accessGroup = "\(Constants.teamID).ru.lexone.SharedItems"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textFromKeychain)
        }
        .padding()
        .onAppear(perform: loadTextFromKeychain)
    }

    private func loadTextFromKeychain() {
        let keychain = Keychain(service: Constants.service, accessGroup: accessGroup).synchronizable(true)
        textFromKeychain = keychain["testKey"] ?? "no data"
    }
}


