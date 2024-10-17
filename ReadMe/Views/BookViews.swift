//
//  BookViews.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        var size: CGFloat?
        
        var body: some View {
            let image = SwiftUI.Image(title: title)
            ?? SwiftUI.Image(systemName: "book")
            image
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first,
        case let symbol = "\(character.lowercased()).square",
        UIImage(systemName: symbol) != nil
        else {
            return nil
        }
        
        self.init(systemName: symbol)
    }
}

struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundStyle(.secondary)
        }
    }
}

struct BookPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: "Carlos")
            Book.Image(title: "")
            Book.Image(title: "🌝")
        }
    }
}
