//
//  ContentView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: Library
    @State var addingNewBook: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(BookSection.allCases, id: \.self) {
                    SectionView(section: $0)
                }
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

private struct SectionView: View {
    let section: BookSection
    @EnvironmentObject var library: Library
    
    var sectionTitle: String {
        switch section {
        case .readMe:
            "Reading list"
        case .finished:
            "Finished"
        }
    }
    
    var body: some View {
        if let books = library.sortedBooks[section] {
            Section {
                ForEach(books) { BookRow(book: $0) }
            } header: {
                Text(sectionTitle)
                    .listRowInsets(.some(.init()))
                    .padding(.vertical)
            }

        }
    }
}

#Preview {
    ContentView().environmentObject(Library())
}
