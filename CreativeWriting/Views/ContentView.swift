//
//  ContentView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var notes: [Note] = SampleNote.contents
    @State private var editing = false
    var note: Note = SampleNote.contents[0]
    @Environment(\.modelContext) private var modelContext

    var body: some View {    
        TabView {
            NoteListView(notes: notes)
                .tabItem { 
                    Image(systemName: "checkmark.gobackward")
                }
            NoteView(note: note)
                .tabItem {
                    Image(systemName: "pencil.and.scribble")
                }
        }
        .accentColor(Color.blue.opacity(0.7))
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}

