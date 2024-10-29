/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

enum BookSection: CaseIterable {
    case readMe
    case finished
}

class Library: ObservableObject {
    var sortedBooks: [BookSection: [Book]] {
        get {
            let groupedBooks = Dictionary(grouping: booksCache, by: \.readMe)
            return Dictionary(uniqueKeysWithValues: groupedBooks.map {
                (($0.key ? .readMe : .finished),$0.value)
            })
        }
        set {
            
        }
    }
    
    func sortBooks() {
        booksCache = sortedBooks
            .sorted { $1.key == .finished }
            .flatMap { $0.value }
        objectWillChange.send()
    }
    
    func deleteBook(index: Int, section: BookSection) {
        if let bookToDelete = sortedBooks[section]?[index] {
            if let indexAtCache = booksCache.firstIndex(of: bookToDelete) {
                booksCache.remove(at: indexAtCache)
            }
            if let imageIndex = images.firstIndex(where: { $0.key.id == bookToDelete.id }) {
                images.removeValue(forKey: bookToDelete)
            }
            sortedBooks[section]?.remove(at: index)
        }
    }
    
    /// Adds a new book at the start of the library's manually-sorted books.
    func addNewBook(_ book: Book, image: Image?) {
        booksCache.insert(book, at: 0)
        images[book] = image
    }

    /// An in-memory cache of the manually-sorted books.
    @Published private var booksCache: [Book] = [
        .init(title: "Invisible Women", author: "Caroline Criado Perez"),
        .init(title: "Cem anos de solidão", author: "Gabriel Garcia Marques"),
        .init(title: "Moby Dick", author: "Herman Melville"),
        .init(title: "Ensaio sobre a cegueira", author: "José Saramago"),
        .init(title: "Genesis", author: "Sebastião Salgado")
    ]
    @Published var images: [Book: Image] = [:]
}
