//
//  HomeView.swift
//  PdfViewer-SwiftUI
//
//  Created by Gaurav Tak on 31/12/23.
//

import SwiftUI

struct HomeView : View {
    @StateObject var homeViewModel = HomeViewModel()
    
    func buildView() -> some View {
        print("buildView---called")
        // return you destination
        if homeViewModel.nextUiType == .savedPdfFileViewer {
            return AnyView(Text("Saved pdf file viewer"))
        } else if homeViewModel.nextUiType == .remotePdfFileViewer {
            return AnyView(Text("Remote pdf file viewer"))
        } else if homeViewModel.nextUiType == .checkLastPageVisitedOfPdfFile {
            return AnyView(Text("Check last page visited of pdf file viewer"))
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
                            homeViewModel.nextUiType = .savedPdfFileViewer
                            homeViewModel.showNextUi = true
                        }  label: {
                            Text("Show saved pdf using pdf viewer").font(.system(size: 20))
                        }
                        
                        Button  {
                            homeViewModel.nextUiType = .remotePdfFileViewer
                            homeViewModel.showNextUi = true
                        }  label: {
                            Text("Show remote pdf using pdf viewer").font(.system(size: 20))
                        }
                        Button  {
                            homeViewModel.nextUiType = .checkLastPageVisitedOfPdfFile
                            homeViewModel.showNextUi = true
                        }  label: {
                            Text("Check last page visited of pdf using pdf viewer").font(.system(size: 20))
                        }
                       
                    }.padding()
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
