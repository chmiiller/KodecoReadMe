//
//  DetailView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            Book.Image(title: book.title)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetailView(book: .init())
}
