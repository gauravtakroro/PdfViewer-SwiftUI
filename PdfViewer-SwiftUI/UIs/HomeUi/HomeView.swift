//
//  HomeView.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import SwiftUI
import PDFKit

struct HomeView : View {
    @StateObject var homeViewModel = HomeViewModel()
    
    func buildView() -> some View {
        print("buildView---called")
        // return you destination
        if homeViewModel.nextUiType == .savedPdfFileViewer {
            return AnyView(PDFUIView(pdfDocument: homeViewModel.pdfDocument))
        } else if homeViewModel.nextUiType == .remotePdfFileViewer {
            return AnyView(PDFUIView(pdfDocument: homeViewModel.pdfDocument))
        } else if homeViewModel.nextUiType == .checkLastPageVisitedOfPdfFile {
            return AnyView(Text("Check last page visited of pdf file viewer"))
          //  AnyView(PDFUIView(pdfDocument: homeViewModel.pdfDocument))
        }    else {
            return AnyView(HomeView())
        }
    }
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack(alignment: .top) {
                    if homeViewModel.showNextUi {
                        NavigationLink(destination: buildView(), isActive: $homeViewModel.showNextUi) {
                            EmptyView()
                        }
                    }
                    
                    VStack (spacing: 20) {
                        VStack {
                            Image(systemName: "book").imageScale(.large)
                                .foregroundColor(.primary)
                            Text("Pdf-Viewer").font(.system(size: 24))
                        }
                        
                        Button  {
                            let url = Bundle.main.url(forResource: "sample", withExtension: "pdf")!
                            homeViewModel.pdfDocument = PDFDocument(url: url)!
                            homeViewModel.nextUiType = .savedPdfFileViewer
                            homeViewModel.showNextUi = true
                        }  label: {
                            Text("Show saved pdf using pdf viewer").font(.system(size: 20))
                        }
                        
                        Button  {
                            homeViewModel.isShowProgressView = true
                            let pdfUrlString = "https://www.mkgandhi.org/ebks/The Story of Gandhi.pdf"
                            print("pdfUrlString.urlEncoded -- \(pdfUrlString.urlEncoded)")
                            let url = URL(string: "https://www.africau.edu/images/default/sample.pdf")
                            PDFDownloader.downloadPdf(pdfUrl: pdfUrlString.urlEncoded, completion: { data in
                                homeViewModel.pdfDocument = PDFDocument(data: data)!
                                DispatchQueue.main.async {
                                    homeViewModel.isShowProgressView = false
                                    self.homeViewModel.nextUiType = .remotePdfFileViewer
                                    self.homeViewModel.showNextUi = true
                                }
                            })
                           
                        }  label: {
                            Text("Show remote pdf using pdf viewer").font(.system(size: 20))
                        }
                        Button  {
                            let url = Bundle.main.url(forResource: "Lipsum", withExtension: "pdf")!
                            homeViewModel.pdfDocument = PDFDocument(url: url)!
                            homeViewModel.nextUiType = .checkLastPageVisitedOfPdfFile
                            homeViewModel.showNextUi = true
                        }  label: {
                            Text("Check last page visited of pdf using pdf viewer").font(.system(size: 20))
                        }
                       
                    }.padding()
                    ProgressViewIndicator(shouldShow: $homeViewModel.isShowProgressView)
                }
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
