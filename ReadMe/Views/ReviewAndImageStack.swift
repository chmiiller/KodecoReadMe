//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Carlos Zinato on 20/10/2024.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct ReviewAndImageStack: View {
    @ObservedObject var book: Book
    @State var showImagePicker = false
    @State var showDeleteImageDialog = false
    @Binding var image: Image?

    var body: some View {
        VStack {
            Divider().padding(.vertical)
            TextField("Write a review", text: $book.microReview)
            Divider().padding(.vertical)
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
    ReviewAndImageStack(book: .init(), image: .constant(nil))
}
