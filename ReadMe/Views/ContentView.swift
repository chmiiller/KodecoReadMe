//
//  ContentView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()

    var body: some View {
        NavigationView {
            List(library.sortedBooks, id: \.self) { book in
                BookRow(book: book, image: $library.images[book])
            }
            .navigationTitle("My Books")
        }
    }
}

#Preview {
    ContentView()
}
