//
//  BookRow.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book, image: $image)) {
            HStack {
                Book.Image(image: image, title: book.title, size: 60, cornerRadius: 12)
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    BookRow(book: Book(title: "Moby-Dick", author: "Herman Melville"), image: .constant(nil))
}

