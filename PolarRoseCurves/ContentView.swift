//
//  ContentView.swift
//  PolarRoseCurves
//
//  Created by Javi Iregui on 2/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var n: Double = 3 // Número de pétalos si k es impar, 2n si k es par
    @State private var k: Double = 5 // Frecuencia de la función
    @State private var progress: Double = 0 // Para animar el dibujo
    
    var body: some View {
        VStack {
            Canvas { context, size in
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                let scale: CGFloat = min(size.width, size.height) / 2.5
                
                var path = Path()
                
                for theta in stride(from: 0.0, to: progress * 2 * .pi, by: 0.01) {
                    let r = cos(k * theta) * scale
                    let x = center.x + r * cos(theta)
                    let y = center.y + r * sin(theta)
                    
                    if theta == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                
                context.stroke(path, with: .color(.blue), lineWidth: 2)
            }
            .frame(width: 300, height: 300)
            .background(Color.black.opacity(0.1))
            .onAppear {
                animateDrawing()
            }
            
            VStack {
                Text("n: \(Int(n))")
                Slider(value: $n, in: 1...10, step: 1) { _ in
                    resetAnimation()
                }
                
                Text("k: \(Int(k))")
                Slider(value: $k, in: 1...10, step: 1) { _ in
                    resetAnimation()
                }
            }
            .padding()
        }
    }
    
    func animateDrawing() {
        progress = 0
        withAnimation(.linear(duration: 2)) {
            progress = 1
        }
    }
    
    func resetAnimation() {
        progress = 0
        animateDrawing()
    }
}

@main
struct RosaPolarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
