//
//  DetailView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var library: Library
    @ObservedObject var book: Book
    
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
            ReviewAndImageStack(book: book, image: $library.images[book])
            Spacer()
        }
    }
}

#Preview {
    DetailView(book: .init()).environmentObject(Library())
}

