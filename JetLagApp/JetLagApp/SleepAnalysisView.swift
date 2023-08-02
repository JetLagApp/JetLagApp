//
//  SleepAnalysisView.swift
//  JetLagApp
//
//  Created by Shin Jae Ung on 2023/08/02.
//

import SwiftUI

struct SleepAnalysisView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                titleArea
                Spacer()
                    .frame(height: 10)
                chartArea
                Spacer()
                    .frame(height: 17)
                analysisByTypeArea
            }
        }
    }
    
    private var titleArea: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 22.4, height: 20.1)
            Spacer()
                .frame(width: 8.61)
            Text("수면 분석")
                .font(.system(size: 26, weight: .bold))
            Spacer()
            Text("2023년 7월 6일 ~ 12일")
                .font(.system(size: 13, weight: .bold))
        }
        .padding(.horizontal, 17)
    }
    
    private var chartArea: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 20)
            HStack(alignment: .bottom, spacing: 0) {
                Text("총 수면시간")
                    .font(.system(size: 13, weight: .bold))
                Spacer()
                Text("컨디션(점수)")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.init(hex: 0xFF7043))
            }
            .padding(.horizontal, 15)
            Spacer()
                .frame(height: 11)
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(.white)
                .frame(height: 284)
                .padding(.horizontal, 15)
            Spacer()
                .frame(height: 13)
            HStack(spacing: 0) {
                Spacer()
                Text("측정 결과는 하루가 지난 뒤 분석됩니다.")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.init(hex: 0xB0B0B0))
            }
            .padding(.horizontal, 14)
            Spacer()
                .frame(height: 12)
        }
        .background {
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(.init(hex: 0xF3F1FA))
        }
        .padding(.horizontal, 20)
    }
    
    private var analysisByTypeArea: some View {
        HStack {
            typeArea
            Divider()
            typeArea
        }
        .background {
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(.init(hex: 0xF3F1FA))
        }
        .padding(.horizontal, 20)
    }
    
    private var typeArea: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 14.54)
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 85, height: 25.7)
                .foregroundColor(.init(hex: 0x44FF6D))
                .overlay {
                    Text("Day")
                }
            Spacer()
                .frame(height: 10.43)
            HStack(spacing: 0) {
                Circle()
                    .padding(.horizontal, 14)
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("총 수면시간")
                            .font(.system(size: 7, weight: .semibold))
                            .foregroundColor(.init(hex: 0x9E9E9E))
                    }
                    Spacer()
                        .frame(height: 5.02)
                    Text("5시간 36분")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.init(hex: 0x342D57))
                    Spacer()
                        .frame(height: 12.04)
                    HStack(spacing: 0) {
                        Text("컨디션 점수")
                            .font(.system(size: 7, weight: .semibold))
                            .foregroundColor(.init(hex: 0x9E9E9E))
                    }
                    Spacer()
                        .frame(height: 5.02)
                    Text("5시간 36분")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.init(hex: 0x342D57))
                }
                .padding(.trailing, 14)
            }
            Spacer()
                .frame(height: 19.04)
        }
    }
}

struct SleepAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        SleepAnalysisView()
    }
}
