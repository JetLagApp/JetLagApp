//
//  StateCircleView.swift
//  JetLagApp
//
//  Created by Shin Jae Ung on 2023/04/04.
//

import SwiftUI

struct StateCircleView<StateTextView: View, GaugeView: View>: View {
    private let stateTextView: () -> (StateTextView)
    private let gaugeView: () -> (GaugeView)
    
    init(@ViewBuilder stateTextView: @escaping () -> StateTextView, @ViewBuilder gaugeView: @escaping () -> GaugeView) {
        self.stateTextView = stateTextView
        self.gaugeView = gaugeView
    }
    
    var body: some View {
        VStack(spacing: 0) {
            stateTextView()
                .padding(.vertical, 4)
                .padding(.horizontal, 26)
                .background {
                    RoundedRectangle(cornerRadius: 4)
                }
            Rectangle()
                .frame(width: 5, height: 8)
            Circle()
                .stroke(lineWidth: 5)
                .overlay {
                    gaugeView()
                        .padding(12)
                }
        }
    }
}

struct StateCircleView_Previews: PreviewProvider {
    static var previews: some View {
        StateCircleView {
            Text("DAY")
                .foregroundColor(.white)
        } gaugeView: {
            GaugeView(gauge: 0.7, lineRatio: 0.1)
        }
        .foregroundColor(.green)
    }
}
