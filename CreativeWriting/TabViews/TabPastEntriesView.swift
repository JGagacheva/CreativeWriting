//
//  TabPastEntriesView.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import SwiftUI

struct TabPastEntriesView: View {
    var body: some View {
        ZStack {
            Image(systemName: "checkmark.gobackward")
                .resizable()
                .frame(width: 300.0, height: 300.0)
                .foregroundColor(.green)
        }
    }
}

struct TabPastEntriesViewPreview: PreviewProvider {
    static var previews: some View {
        TabPastEntriesView()
    }
}
