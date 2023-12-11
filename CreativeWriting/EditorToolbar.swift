//
//  EditorToolbar.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI

struct EditorToolbar: ToolbarContent {
    let isEnabled: Bool
    @Binding var editing: Bool

    var body: some ToolbarContent {
        ToolbarItem {
            Button {
                editing.toggle()
            } label: {
                Image(systemName: editing ? "play" : "pencil" )
            }
            .disabled(!isEnabled)
        }
    }
}

// is this a change?
