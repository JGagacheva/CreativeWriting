//
//  ContentView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var notes: [Note]
    @State private var editing = false
    @State private var navigationPath: [Note] = []
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack(path: $navigationPath) {
            NoteListView(notes: notes, editing: $editing) { note in
                withAnimation { navigationPath.append(note) }
            } addNode: {
                let newNote = Note(title: "What are you thinking about?", body: "Tell me more.")
                modelContext.insert(newNote)
                withAnimation {
                    editing = true
                    navigationPath.append(newNote)
                }
            }
            .padding()
            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}

