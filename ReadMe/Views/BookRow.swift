//
//  BookRow.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct BookRow: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book)) {
            HStack {
                Book.Image(image: library.images[book], title: book.title, size: 60, cornerRadius: 12)
                VStack(alignment: .leading) {
                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                        .lineLimit(1)
                    if !book.microReview.isEmpty {
                        Text(book.microReview).font(.subheadline).foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    BookRow(book: Book(title: "Moby-Dick", author: "Herman Melville")).environmentObject(Library())
}

