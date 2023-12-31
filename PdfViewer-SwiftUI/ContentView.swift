//
//  ContentView.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
