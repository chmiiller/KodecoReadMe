//
//  DetailView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    let book: Book
    @State var showImagePicker = false
    @Binding var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                Button("Update image") {
                    showImagePicker = true
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker, content: {
            PHPickerViewController.View(image: $image)
        })
    }
}

#Preview {
    DetailView(book: .init(), image: .constant(nil))
}
