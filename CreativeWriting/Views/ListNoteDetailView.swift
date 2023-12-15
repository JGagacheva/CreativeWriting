//
//  ListNoteDetailView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/13/23.
// Scrolable view for the list view -- make it like card carousel

import SwiftUI


struct ListNoteDetailView: View {
    var note: Note
    var body: some View {
        ScrollView {
            VStack {
                Text(note.title)
                    .padding([.leading, .trailing], 30.0)
                    .padding(.bottom, 15)
                    .lineLimit(10)
                    .font(.system(.title, design: .serif))
                Text(note.body)
                    .padding([.leading, .trailing], 30.0)
                    .font(.system(.body, design: .serif))
            }
        }

    }
}


