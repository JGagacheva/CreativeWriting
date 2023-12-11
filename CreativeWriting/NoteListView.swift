//
//  NoteListView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI

struct NoteListView: View {
    var notes: [Note]
    @Binding var editing: Bool
    let selectNote: (Note) -> Void
    let addNode: () -> Void

    var body: some View {
        List {
            if Design.editFeatureEnabled {
                CardGalleryItem(backgroundStyle: .fill.tertiary, action: addCard) {
                    LabeledContent("Add Card") {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    .labelsHidden()
                }
                .shadow(radius: 2)
            }
            
            ForEach(notes) { note in
                NavigationLink {
                    Text(note.body)
                } label: {
                    Text(note.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(note.dateCreated, format: Date.FormatStyle(date: .numeric, time: .standard))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .swipeActions(edge: .leading) {
        }
        .navigationDestination(for: Note.self) { note in
            return NoteView(note: note)
        }
    }
}
