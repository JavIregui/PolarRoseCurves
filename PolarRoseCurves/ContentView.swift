//
//  ContentView.swift
//  PolarRoseCurves
//
//  Created by Javi Iregui on 2/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var n: Double = 5
    @State private var d: Double = 1
    @State private var showNInfo = false
    @State private var showDInfo = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Polar Rose Curves")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                    }
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    VStack(spacing: 25) {
                        VStack {
                            HStack {
                                Text("Number of petals: ").bold() + Text("\(Int(n))")
                                Spacer()
                                Button(action: { showNInfo.toggle() }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.blue)
                                }
                                .popover(isPresented: $showNInfo) {
                                    Text("Controls the number of petals in the Polar Rose Curve.")
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding()
                                        .presentationCompactAdaptation(.popover)
                                }
                            }
                            
                            Slider(value: $n, in: 1...10, step: 1)
                        }
                        
                        VStack {
                            HStack {
                                Text("Symmetry factor: ").bold() + Text("\(Int(d))")
                                Spacer()
                                Button(action: { showDInfo.toggle() }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.blue)
                                }
                                .popover(isPresented: $showDInfo) {
                                    Text("Modifies the symmetry and distribution of the petals.")
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding()
                                        .presentationCompactAdaptation(.popover)
                                }
                            }
                            
                            Slider(value: $d, in: 1...10, step: 1)
                        }
                    }
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 50)
            }
            .navigationBarHidden(true)
        }
    }
}




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
