//
//  AnimationVC.swift
//  ImpetusOn
//
//  Created by VVDN on 14/08/23.
//

import SwiftUI

struct AnimationVC: View {
    @State private var scale = 1.0
    @State private var angle = 0.0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.00"
    @State var x: CGFloat = 0
    @State var y: CGFloat = 0
    
    var body: some View {
        VStack {
//            Button {
                self.spiralAnimation()
//            } label: {
//                Text("Spiral")
//            }
//
//            Button {
//              bouncingAnimation()
//            } label: {
//                Text("Bounce")
//            }
        }
    }
    
    func bouncingAnimation() -> some View {
        
        VStack {
            Spacer()
            Circle()
                .fill(.orange)
                .frame(width: 30, height: 30)
                .offset(x: x, y: y) // x and y are associated with different time sequence curve functions
            Spacer()
            Button("Animate") {
                withAnimation(.linear) {
                    if x == 0 { x = 100 } else { x = 0 }
                }
                withAnimation(.easeInOut(duration: 1)) {
                    if y == 0 { y = 100 } else { y = 0 }
                }
            }
        }
        .frame(width: 500, height: 500)
        
    }
    
    func spiralAnimation() -> some View {
        
        Image("spiral")
            .resizable()
            .clipShape(Circle())
            .frame(maxWidth: 50,maxHeight: 50)
            .onReceive(timer) { _ in
                scale += 1.0
                //            scale += 1.0
                angle += 45.0
            }
            .onTapGesture {
                isTimerRunning == true ? self.stopAnimation() : startAnimation()
                isTimerRunning = !isTimerRunning
                
            } .scaleEffect(scale)
            .rotationEffect(.degrees(angle))
            .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 1),value: scale)
    }
    
    func stopAnimation() {
        timer.upstream.connect().cancel()
    }
    
    func startAnimation() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

struct AnimationVC_Previews: PreviewProvider {
    static var previews: some View {
        AnimationVC()
    }
}
