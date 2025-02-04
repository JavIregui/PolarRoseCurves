//
//  ContentView.swift
//  PolarRoseCurves
//
//  Created by Javi Iregui on 2/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .ignoresSafeArea()
            
            VStack {
                Text("Polar Rose Curves\nGenerator")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 25)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack{
                    
                }
            }
        }
    }

    
//    @State private var n: Double = 5
//    @State private var k: Double = 5
//    @State private var progress: Double = 0
//    
//    var body: some View {
//        VStack {
//            Canvas { context, size in
//                let center = CGPoint(x: size.width / 2, y: size.height / 2)
//                let scale: CGFloat = min(size.width, size.height) / 2.25
//                
//                var path = Path()
//                
//                for theta in stride(from: 0.0, to: progress * 2 * .pi, by: 0.01) {
//                    let r = cos(k * theta) * scale
//                    let x = center.x + r * cos(theta)
//                    let y = center.y + r * sin(theta)
//                    
//                    if theta == 0 {
//                        path.move(to: CGPoint(x: x, y: y))
//                    } else {
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                }
//                
//                context.stroke(path, with: .color(.blue), lineWidth: 3)
//            }
//            .frame(width: 300, height: 300)
//            .background(Color.black.opacity(0.9))
//            .onAppear {
//                animateDrawing()
//            }
//            
//            VStack {
//                Text("n: \(Int(n))")
//                Slider(value: $n, in: 1...10, step: 1) { _ in
//                    resetAnimation()
//                }
//                
//                Text("k: \(Int(k))")
//                Slider(value: $k, in: 1...10, step: 1) { _ in
//                    resetAnimation()
//                }
//            }
//            .padding()
//        }
//        .background(Color.black) // Fondo negro para toda la vista
//        .ignoresSafeArea() // Asegura que cubra toda la pantalla
//    }
//    
//    func animateDrawing() {
//        progress = 0
//        withAnimation(.linear(duration: 2)) {
//            progress = 1
//        }
//    }
//    
//    func resetAnimation() {
//        progress = 0
//        animateDrawing()
//    }
}
