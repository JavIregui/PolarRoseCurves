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
    
    @State private var progress: Double = 0
    @State private var timer: Timer?
    @State private var startTime: Date?
    @State private var totalDuration: Double = 1.0
    
    @State private var showNInfo = false
    @State private var showDInfo = false
    
    @State private var colorIndex: Int = 0
    let colors: [Color] = [Color("AccentColor"), Color("Red"), Color("Blue"), Color("Yellow"), Color("Purple"), Color("Orange")]


    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    Text("Polar Rose Curves")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("r(θ) = cos((n/d) * θ)")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.25))
                    
                    Spacer()
                    
                    Canvas { context, size in
                        let center = CGPoint(x: size.width / 2, y: size.height / 2)
                        let scale: CGFloat = min(size.width, size.height) / 2.25
                                            
                        var path = Path()
                                    
                        for theta in stride(from: 0.0, to: progress * 2 * .pi * d, by: 0.01) {
                            let r = cos((n/d) * theta) * scale
                            let x = center.x + r * cos(theta)
                            let y = center.y + r * sin(theta)

                            if theta == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }

                        context.stroke(path, with: .color(colors[colorIndex]), lineWidth: 3)
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.black.opacity(0))
                    .onAppear {
                        animateDrawing()
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
                                    Text("Controls the number of petals in the curve.")
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding()
                                        .presentationCompactAdaptation(.popover)
                                }
                            }
                            
                            Slider(value: $n, in: 1...10, step: 1)
                                .onChange(of: n) {
                                    calculateDuration()
                                    resetAnimation()
                                }
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
                                .onChange(of: d) {
                                    calculateDuration()
                                    resetAnimation()
                                }
                        }
                    }
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 50)
            }
            .navigationBarHidden(true)
        }
    }
    
    func calculateDuration() {
        let k = n/d
        let thetaMax = 2 * Double.pi * d
        let steps = 1000
        let dTheta = thetaMax/Double(steps)
        var totalLength: Double = 0.0
            
        var previousIntegrand = sqrt(pow(cos(0), 2) + pow(k * sin(0), 2))
            
        for i in 1...steps {
            let theta = Double(i) * dTheta
            let currentIntegrand = sqrt(pow(cos(k * theta), 2) + pow(k * sin(k * theta), 2))
            totalLength += (previousIntegrand + currentIntegrand) * dTheta/2
            previousIntegrand = currentIntegrand
        }
            
        let desiredSpeed: Double = 5.0
        totalDuration = totalLength/desiredSpeed
    }
        
    func animateDrawing() {
        progress = 0
        timer?.invalidate()
        startTime = Date()
            
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [self] timer in
            guard let startTime = startTime else {
                timer.invalidate()
                return
            }
                
            let elapsed = Date().timeIntervalSince(startTime)
            progress = min(elapsed/totalDuration, 1.0)
                
            if progress >= 1 {
                timer.invalidate()
            }
        }
    }
        
    func resetAnimation() {
        progress = 0
        var newIndex = colorIndex
        while(newIndex == colorIndex){
            newIndex = Int.random(in: 0..<colors.count)
        }
        colorIndex =  newIndex
        animateDrawing()
    }
}
