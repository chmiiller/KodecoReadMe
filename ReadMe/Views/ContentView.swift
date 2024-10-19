//
//  ContentView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    @State var addingNewBook: Bool = false

    var body: some View {
        NavigationView {
            List(library.sortedBooks) { book in
                BookRow(book: book, image: $library.images[book])
            }
            .navigationTitle("My Books")
            .toolbar(content: {
                Button(action: {
                    addingNewBook = true
                }, label: {
                    Image(systemName: "plus.circle").font(.title2)
                })
            })
        }
        .sheet(isPresented: $addingNewBook, content: {
            NewBookView()
        })
    }
}

#Preview {
    ContentView()
}
