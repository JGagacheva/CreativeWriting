//
//  TabCurrentEntryView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI

struct TabCurrentEntryView: View {
    var body: some View {
        ZStack {
            Image(systemName: "pencil.and.scribble")
                .resizable()
                .frame(width: 300.0, height: 250.0)
                .padding([.bottom, .top], 25)
                .foregroundColor(.green)
        }
    }
}

struct TabCurrentEntryViewPreview: PreviewProvider {
    static var previews: some View {
        TabCurrentEntryView()
    }
}
