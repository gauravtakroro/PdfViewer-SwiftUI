//
//  ContentView.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .imageScale(.large)
                .foregroundColor(.primary)
            Text("Pdf Viewer")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
