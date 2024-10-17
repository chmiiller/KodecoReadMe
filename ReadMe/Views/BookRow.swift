//
//  BookRow.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    var body: some View {
        NavigationLink(destination: DetailView(book: book)) {
            HStack {
                Book.Image(title: book.title, size: 60)
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    BookRow(book: Book(title: "Moby-Dick", author: "Herman Melville"))
}

