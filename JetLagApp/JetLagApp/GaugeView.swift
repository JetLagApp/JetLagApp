//
//  GaugeView.swift
//  JetLagApp
//
//  Created by Shin Jae Ung on 2023/03/10.

import SwiftUI

struct GaugeView: View {
    let gauge: Double
    let lineRatio: Double
    @State private var radius: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Circle()
                .trim(from: 0, to: gauge)
                .stroke(style: StrokeStyle(lineWidth: radius * lineRatio))
                .fill(.black)
                .padding(radius * lineRatio - radius * lineRatio / 2)
                .rotationEffect(.degrees(-90))
                .background {
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                radius = min(proxy.size.width, proxy.size.height) / 2
                            }
                    }
                }
            
            VStack {
                Text("수면")
                    .helveticaFont(size: 8, weight: .bold)
                Text("\(Int(gauge * 100))%")
                    .helveticaFont(size: 11, weight: .bold)
            }
            .foregroundColor(Color.white)
            .padding()
            .background {
                Circle()
            }
        }
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView(gauge: 0.7, lineRatio: 0.2)
    }
}
