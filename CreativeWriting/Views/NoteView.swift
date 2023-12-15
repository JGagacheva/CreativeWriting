//
//  NoteView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var titlePlaceholder: Bool = true
    @State private var bodyPlaceholder: Bool = true
    @Bindable var note: Note
        
    var body: some View {
        VStack {
            TextField("What are you thinking about?", text:  $note.title, axis: .vertical)
                .padding(.all, 30.0)
                .foregroundColor(self.titlePlaceholder ? Color.gray : Color.black)
                .font(.system(.title, design: .serif)).onTapGesture {
                    if self.titlePlaceholder {
                        self.note.title = ""
                        self.titlePlaceholder = false
                    }
                }
                .multilineTextAlignment(.center)
                .lineLimit(5)
            TextEditor(text: $note.body)
                .padding([.leading, .bottom, .trailing], 30.0)
                .foregroundColor(self.bodyPlaceholder ? Color.gray : Color.black)
                .scrollContentBackground(.hidden)
                .font(.system(.body, design: .serif)).onTapGesture {
                    if self.bodyPlaceholder {
                        self.note.body = ""
                        self.bodyPlaceholder = false
                    }
                }
        }
//        .toolbar {
//            Button("Save", action: addItem)
//        }
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let example = Note(title: "What are you thinking about?", body: "Tell me more.")
        return NoteView(note: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

