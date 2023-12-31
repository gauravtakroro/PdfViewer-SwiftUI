//
//  PDFDownloader.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import Foundation
import UIKit

class PDFDownloader {
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func downloadPdf(pdfUrl: String?, completion: @escaping (Data) -> Void) {
        if pdfUrl == nil || pdfUrl!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty {
           return
       }
        if let url = URL(string: pdfUrl!.trimmingCharacters(in: CharacterSet.whitespaces)) {
            PDFDownloader.getData(from: url) { data, response, error in
               guard let data = data, error == nil else { return }
               print(response?.suggestedFilename ?? url.lastPathComponent)
               print("Download Finished downloadPdf \(data)")
               completion(data)
           }
       }
    }
}
