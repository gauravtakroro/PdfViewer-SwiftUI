//
//  ProgressViewIndicator.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import SwiftUI

struct ProgressViewIndicator: View {
    @Binding var shouldShow: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .scaleEffect(x: 2, y: 2, anchor: .center)
        }
        .opacity(shouldShow ? 1 : 0)
    }
}

#if DEBUG
struct ProgressViewIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewIndicator(shouldShow: .constant(true))
    }
}
#endif
