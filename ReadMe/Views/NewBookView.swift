//
//  NewBookView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 19/10/2024.
//

import SwiftUI

struct NewBookView: View {
    @EnvironmentObject var library: Library
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                TextField("Title", text: $book.title)
                    .font(.title)
                TextField("Author", text: $book.author)
                    .font(.title2)
                    .foregroundStyle(.secondary)
                ReviewAndImageStack(book: book, image: $image)
            }
            .navigationTitle("New book")
            .padding()
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Save") {
                        if !book.title.isEmpty && !book.author.isEmpty {
                            library.addNewBook(book, image: image)
                            dismiss()
                        }
                    }.disabled(book.title.isEmpty && book.author.isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewBookView().environmentObject(Library())
}
