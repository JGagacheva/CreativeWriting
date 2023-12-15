//
//  NoteListView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI
import SwiftData

//
//  ContentView.swift
//  journal
//
//  Created by Jana on 10/12/23.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
    @Environment(\.modelContext) private var modelContext
    var notes: [Note]
    @State private var path = [Note]()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        ListNoteDetailView(note: note)
                    } label: {
                        Text(note.title)
                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                            .font(.system(.body, design: .serif))
                        Text(note.dateCreated, format: Date.FormatStyle(date: .numeric, time: .standard))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.system(.body, design: .serif))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .swipeActions(edge: .leading) {
            }
            .navigationDestination(for: Note.self) { note in
                return NoteView(note: note)
            }
        }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
    }
    public func addItem() {
        withAnimation {
            let note = Note(title: "What are you thinking about?", body: "Tell me more.", dateCreated: Date())
            modelContext.insert(note)
            path.append(note)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
}
 
//#Preview {
struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Note.self, inMemory: true)
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
    }
}



