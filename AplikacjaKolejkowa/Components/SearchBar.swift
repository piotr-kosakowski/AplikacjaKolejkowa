//
//  SearchBar.swift
//  AplikacjaKolejkowa
//
//  Created by Pawel Swiderski on 26/11/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("", text: $text, prompt: Text("Wyszukaj...").foregroundColor(.black.opacity(0.5)))
                .padding(7)
                .padding(.horizontal, 25)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(hex: "#f1f8f8"))

    }
}

#Preview {
    SearchBar(text: .constant(""))
}
