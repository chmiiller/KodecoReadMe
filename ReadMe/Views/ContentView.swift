//
//  ContentView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    let library = Library().sortedBooks
    var body: some View {
        NavigationView {
            List(library, id: \.title) { item in
                BookRow(book: item)
            }
            .navigationTitle("My Books")
        }
    }
}

#Preview {
    ContentView()
}
