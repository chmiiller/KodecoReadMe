//
//  DetailView.swift
//  ReadMe
//
//  Created by Carlos Zinato on 17/10/2024.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    var book: Book
    @State var showImagePicker = false
    @State var showDeleteImageDialog = false
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
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                HStack {
                    if image != nil {
                        Button("Delete image") {
                            showDeleteImageDialog = true
                        }
                        Spacer()
                    }
                    Button("Update image") {
                        showImagePicker = true
                    }
                }.padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker, content: {
            PHPickerViewController.View(image: $image)
        })
        .confirmationDialog(LocalizedStringKey("Delete book image"), isPresented: $showDeleteImageDialog) {
            Button("Delete", role: .destructive) { image = nil }
        } message: {
            Text("Delete image for \(book.title)?")
        }
    }
}

#Preview {
    DetailView(book: .init(), image: .constant(nil))
}
