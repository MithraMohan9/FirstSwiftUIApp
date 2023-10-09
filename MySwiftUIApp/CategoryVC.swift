//
//  CategoryVC.swift
//  ImpetusOn
//
//  Created by VVDN on 26/09/23.
//

import SwiftUI

struct CategoryVC: View {
    private let url = URL(string: "https://www.appcoda.com")!
    let samplePhotos = (1...8).map { Photo(name: "cafe-\($0)") }
    @State var gridLayout: [GridItem] = [ GridItem(.flexible(),spacing: 5),GridItem(.flexible(),spacing: 5)]

    
    var body: some View {
        ScrollView{
            Text("Categories")
                .font(.system(size: 50, weight: .heavy, design: .rounded))

            LazyVGrid(columns: gridLayout, spacing: 0) {
        ForEach(samplePhotos.indices, id: \.self) { index in
        
                    //            Text("**This is how you bold a text**. *This is how you make text italic.* You can [click this link](https://www.appcoda.com) to go to appcoda.com")
                    //                .font(.title).shadow(color: .gray, radius: 1, x: 0, y: 8
                    //            ShareLink(item: url) {
                    //                Label("Tap me to share", systemImage:  "square.and.arrow.up")
                    //            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hue: 0.46, saturation: 0.054, brightness: 0.908, opacity: 0.797))
                VStack{
                    Image(samplePhotos[index].name).resizable().cornerRadius(20).frame(maxHeight: 150)
                    //                    View()                    BlurView(style: .light)
                    
                    //                        Rectangle().foregroundColor(.gray).cornerRadius(10)
                    //                        .background(Color.black.opacity(0.4))
                    //                     .foregroundColor(.secondary)
                    //                     .background(.ultraThinMaterial)
                    //                     .frame(width: 100, height: 100)
                    //then you can add opacity to see a bit more of the background:
                    //                            .opacity(0.85)
                  
                    Text("TestTestTestTestTestTestTestTest")//.background(.ultraThinMaterial)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                
                }
                .padding()
            }
        }.padding()
            }
        }
    }
}

struct CategoryVC_Previews: PreviewProvider {
    static var previews: some View {
        CategoryVC()
    }
}
