//
//  DemoView.swift
//  ImpetusOn
//
//  Created by VVDN on 21/09/23.
//

import SwiftUI

struct DemoView: View {
    @State var gridLayout: [GridItem] = [ GridItem() ]
    let samplePhotos = (1...5).map { Photo(name: "coffee-\($0)") }
    @State var username: String = ""
    
    var body: some View {
        
        NavigationView {
            List{
                HStack(alignment: .center) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                    .foregroundColor(.accentColor)
                    VStack(alignment: .leading) {
                        Text("Hello World,")
                        Text("Welcome to SwiftUI Basics")
                    }
                }
                .padding(.all)
                VStack {
                    TextField("Chennai Central", text: $username)
                } .padding()
                VStack {
                    TextField("Velachery", text: $username)
                }.padding()
                VStack {
                    Text("Primary Services")
                }
                VStack {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridLayout,alignment: .center,spacing: 20) {
                            ForEach(samplePhotos.indices, id: \.self) { index in
                                //                                ZStack {
                                //                                    Rectangle().foregroundColor(.white)
                                //                                        .frame(width: 80, height: 80)
                                //                                        .cornerRadius(10)
                                //
                                //                                        .border(.gray)
                                //                                        .cornerRadius(10)

                                VStack{
                                    Image(samplePhotos[index].name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: 30)
                                        .frame(height: 30)
                                        .cornerRadius(10)
                                        .shadow(color: Color.primary.opacity(0.3), radius: 1)
                                    Text("Test")
                                } .padding(.all, 20)
                                    .frame(width: 80)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1))
                            }
                        }
                    }
                }

                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
                VStack {
                    Text("Secondary Services")
                }
                VStack {
                    ScrollView (.horizontal) {
                        LazyHGrid(rows: gridLayout,alignment: .center,spacing: 20) {
                            ForEach(samplePhotos.indices, id: \.self) { index in
                                //                                ZStack {
                                //                                    Rectangle().foregroundColor(.purple)
                                //                                        .frame(width: 80, height: 80)
                                //                                        .cornerRadius(10)
                                VStack{
                                    Image(samplePhotos[index].name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: 30)
                                        .frame(height: 30)
                                        .cornerRadius(10)
                                        .shadow(color: Color.primary.opacity(0.3), radius: 1)
                                    Text("Test")
                                }
                                .padding(.all)
                                .overlay(
                                    Capsule(style: .continuous)
                                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))
                                //                                }
                            }
                        }
                    }
                }

                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)

                //                VStack {
                ScrollView {
                    LazyVGrid(columns:gridLayout,alignment: .leading,spacing: 20) {
                        ForEach(samplePhotos.indices, id: \.self) { index in

                            //                                ZStack {
                            //                                    Rectangle().foregroundColor(.purple)
                            //                                        .frame(width: 80, height: 80)
                            //                                        .cornerRadius(10)
                            HStack(alignment: .center){
                                Image(samplePhotos[index].name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: 80)
                                    .frame(height: 80)
                                    .cornerRadius(10)
                                    .shadow(color: Color.primary.opacity(0.3), radius: 1)
                                Text("One of the most common and recognizable user interface components is the combination of an icon and a label. This idiom appears across many kinds of apps and shows up in collections, lists, menus of action items, and disclosable lists, just to name a few.")
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                            }.lineLimit(3)
                                .padding(.all)
                            //                                    .overlay(.gray, in: Rectangle().stroke(.gray,lineWidth: 1))
                            //                                }
                        }
                        //                        }


                    }
                }


                //                    Button("Proceed to book") {

                HStack(alignment: .center){
//                    Text("Proceed to book")
//                        .multilineTextAlignment(.center)
                    Button(role: .none, action: {}, label: {Text("Proceed to book")}).buttonStyle(.bordered)
                    NavigationLink(destination: DetailVC().self) {

                    }
                }


            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
