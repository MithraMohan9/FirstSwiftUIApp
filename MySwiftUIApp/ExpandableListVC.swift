//
//  ExpandableListVC.swift
//  ImpetusOn
//
//  Created by VVDN on 14/08/23.
//

import SwiftUI

// Main menu items
let sampleMenuItems = [ MenuItem(name: "Espresso Machines", image: "linea-mini", subMenuItems: espressoMachineMenuItems),
                        MenuItem(name: "Grinders", image: "swift-mini", subMenuItems: grinderMenuItems),
                        MenuItem(name: "Other Equipment", image: "espresso-ep", subMenuItems: otherMenuItems)
]

// Sub-menu items for Espressco Machines
let espressoMachineMenuItems = [ MenuItem(name: "Leva", image: "leva-x", subMenuItems: [ MenuItem(name: "Leva X", image: "leva-x"), MenuItem(name: "Leva S", image: "leva-s") ]),
                                 MenuItem(name: "Strada", image: "strada-ep", subMenuItems: [MenuItem(name: "Strada EP", image: "strada-ep"), MenuItem(name: "Strada AV", image: "strada-av"), MenuItem(name: "Strada MP", image: "strada-mp"), MenuItem(name: "Strada EE", image: "strada-ee") ]),
                                 MenuItem(name: "KB90", image: "kb90"),
                                 MenuItem(name: "Linea", image: "linea-pb-x", subMenuItems: [ MenuItem(name: "Linea PB X", image: "linea-pb-x"), MenuItem(name: "Linea PB", image: "linea-pb"), MenuItem(name: "Linea Classic", image: "linea-classic") ]),
                                 MenuItem(name: "GB5", image: "gb5"),
                                 MenuItem(name: "Home", image: "gs3", subMenuItems: [ MenuItem(name: "GS3", image: "gs3"), MenuItem(name: "Linea Mini", image: "linea-mini") ])
]

// Sub-menu items for Grinder
let grinderMenuItems = [ MenuItem(name: "Swift", image: "swift"),
                         MenuItem(name: "Vulcano", image: "vulcano"),
                         MenuItem(name: "Swift Mini", image: "swift-mini"),
                         MenuItem(name: "Lux D", image: "lux-d")
]

// Sub-menu items for other equipment
let otherMenuItems = [ MenuItem(name: "Espresso AV", image: "espresso-av"),
                       MenuItem(name: "Espresso EP", image: "espresso-ep"),
                       MenuItem(name: "Pour Over", image: "pourover"),
                       MenuItem(name: "Steam", image: "steam")
]


struct ExpandableListVC: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                List(sampleMenuItems, children: \.subMenuItems) { item in
                    HStack {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Text(item.name)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                    }
                }.frame(height: 300)
                List {
                    OutlineGroup(sampleMenuItems, children: \.subMenuItems) {  item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(item.name)
                                .font(.system(.title3, design: .rounded))
                                .bold()
                        }
                    }
                }.frame(height: 300)
                List {
                    ForEach(sampleMenuItems) { menuItem in
                        Section(header:
                                    HStack {
                            Text(menuItem.name)
                                .font(.title3)
                                .fontWeight(.heavy)
                            Image(menuItem.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }.padding(.vertical)) {
                            OutlineGroup(menuItem.subMenuItems ?? [MenuItem](), children: \.subMenuItems) {  item in
                                HStack {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    
                                    Text(item.name)
                                        .font(.system(.title3, design: .rounded))
                                        .bold()
                                }
                            }
                        }
                    }
                }.frame(height: 1200)
            }
        }
    }
}

struct ExpandableListVC_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListVC()
    }
}
