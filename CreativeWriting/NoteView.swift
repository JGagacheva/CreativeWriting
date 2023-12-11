//
//  NoteView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @State private var titlePlaceholder: Bool = true
    @State private var bodyPlaceholder: Bool = true
    @Bindable var note: Note
    
    var body: some View {
        VStack {
            TextField("What are you thinking about?", text:  $note.title, axis: .vertical)
                .padding(.all, 10.0)
                .foregroundColor(self.titlePlaceholder ? Color.gray : Color.black)
                .font(.title2).onTapGesture {
                    if self.titlePlaceholder {
                        self.note.title = ""
                        self.titlePlaceholder = false
                    }
                }
                .multilineTextAlignment(.center)
                .lineLimit(5)
            TextEditor(text: $note.body)
                .padding([.leading, .bottom, .trailing], 6.0)
                .foregroundColor(self.bodyPlaceholder ? Color.gray : Color.blue.opacity(0.5))
                .font(.custom("HelveticaNeue", size: 18)).onTapGesture {
                    if self.bodyPlaceholder {
                        self.note.body = ""
                        self.bodyPlaceholder = false
                    }
                }
        }
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let example = Note(title: "Sample Title", body: "Sample Body")
        return NoteView(note: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
