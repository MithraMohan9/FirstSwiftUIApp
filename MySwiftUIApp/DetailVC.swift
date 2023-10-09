//
//  DetailVC.swift
//  ImpetusOn
//
//  Created by Mithra on 25/05/23.
//

import SwiftUI

struct DetailVC: View {
    
    @State var results = [TaskEntry]()
    
      var body: some View {
          List(results, id: \.id) { item in
              HStack(alignment: .center) {
                  Text(item.name?.uppercased() ?? "")
                  Text(String(item.id ?? 0))
              }.frame(width: 300, height: 400).padding(.all, 10).background(
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                  .edgesIgnoringSafeArea(.all)).overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 1))
          }.onAppear(perform: loadData)
      }
    
      func loadData() {
          guard let url = URL(string: "https://mocki.io/v1/f3d99e9f-564e-4119-b1fc-3900334aa440") else {
              print("Your API end point is Invalid")
              return
          }
          
          let request = URLRequest(url: url)
          URLSession.shared.dataTask(with: request) { data, response, error in
              if let data = data {
                  if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                      DispatchQueue.main.async {
                          self.results = response
                      }
                      return
                  }
              }
          }.resume()
      }
    
    func loadData1() {
        guard let url = URL(string: "https://dev-1067z3789168419.api.raw-labs.com/json-programming-heroes") else {
            print("Your API end point is Invalid")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
  }


struct DetailVC_Previews: PreviewProvider {
    static var previews: some View {
        DetailVC()
    }
}
