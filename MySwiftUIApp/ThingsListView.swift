//
//  ThingsListView.swift
//  ImpetusOn
//
//  Created by VVDN on 29/08/23.
//

import SwiftUI

struct ThingsListView: View {
    var body: some View {
        List(0..<15) { item in
//            ForEach((1...10), id: \.self) {_ in
//            Color.gray

                ZStack(alignment: .leading) {
//                    Color.gray
                    Rectangle().foregroundColor(Color(hue: 0.419, saturation: 0.133, brightness: 0.635)).cornerRadius(10)
//                    VStack{
                        HStack{
                            Image("cafe-1").resizable().clipShape(Circle()).frame(width: 50, height: 50).scaledToFill()
                            VStack {
                                Text("Title")
                                Text("Title")
                            }
                            Spacer()
                            Text(" Test ")
                                .padding(4)
                                .background(Color(hue: 0.436, saturation: 0.4, brightness: 0.5)).cornerRadius(20)//.opacity(0.5)
                                .padding(2)
                                .background(Color.gray).cornerRadius(20)

                        }.padding(.all)
//                    }
                }.padding(.all,5)
                
//                    .foregroundColor(.black)
                .listRowBackground(Color(hue: 0.437, saturation: 0.204, brightness: 0.531))
        }
            .scrollContentBackground(.hidden).background(Color.gray)
//            .padding().background(Color.black)
//            .padding(.all)
//            .background(Color.gray)
//            .listRowSeparator(.hidden)
//            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
//            .listStyle(.plain)
//        }
    }
}

struct ThingsListView_Previews: PreviewProvider {
    static var previews: some View {
        ThingsListView()
    }
}
