//
//  GridVC.swift
//  ImpetusOn
//
//  Created by Mithra on 09/08/23.
//

import SwiftUI

struct GridVC: View {
    @State var gridLayout: [GridItem] = [ GridItem(.flexible(),spacing: 10),GridItem(.flexible(),spacing: 10),GridItem(.flexible(),spacing: 0)]
    
    let samplePhotos = (1...21).map { Photo(name: "coffee-\($0)") }
    var body: some View {
        ScrollView {
            ForEach(samplePhotos.indices, id: \.self) { index in
                Image(samplePhotos[index].name).resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:50,maxHeight: 400)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))],spacing: 10) {
                    ForEach(samplePhotos.indices, id: \.self) { index in
                        Image(samplePhotos[index].name).resizable()                        .frame(minWidth: 50, maxWidth: 80, minHeight:50,maxHeight: 80)
                    }
                }
            }
        }
        
        //        {
        //            LazyVGrid(columns: gridLayout,spacing: 10) {
        //                ForEach(samplePhotos.indices, id: \.self) { index in
        //                    Image(samplePhotos[index].name).resizable()
        //                        .frame(minWidth: 0, maxWidth: 200, minHeight:50,maxHeight: 200)
        //                }
        //            }
        //        }
    }
}

struct GridVC_Previews: PreviewProvider {
    static var previews: some View {
        GridVC()
    }
}
