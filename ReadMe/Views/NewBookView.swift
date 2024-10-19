//
//  NewBookView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 19/10/2024.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil

    var body: some View {
        VStack(spacing: 24) {
            TextField("Book Title", text: $book.title)
                .font(.title)
            TextField("Book Author", text: $book.author)
                .font(.title2)
                .foregroundStyle(.secondary)
            ReviewAndImageStack(book: book, image: $image)
        }
    }
}

#Preview {
    NewBookView()
}
