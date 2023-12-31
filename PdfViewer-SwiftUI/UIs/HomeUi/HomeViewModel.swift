//
//  HomeViewModel.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import Foundation

enum PdfViewType: Int {
    case savedPdfFileViewer = 1
    case remotePdfFileViewer = 2
    case checkLastPageVisitedOfPdfFile = 3
}

protocol HomeViewModelProtocal: ObservableObject {
    var nextUiType: PdfViewType { get set }
}

class HomeViewModel: HomeViewModelProtocal {
    @Published var nextUiType: PdfViewType = .savedPdfFileViewer
    @Published var showNextUi: Bool = false
}

