//
//  DetailView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    book.readMe.toggle()
                }, label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark").font(.largeTitle)
                })
                TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
                
            }
            ReviewAndImageStack(book: book, image: $image)
            Spacer()
        }
    }
}

#Preview {
    DetailView(book: .init(), image: .constant(nil))
}

