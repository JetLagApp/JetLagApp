//
//  HomeView.swift
//  JetLagApp
//
//  Created by Shin Jae Ung on 2023/03/03.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            /// Background color
            Color.init(hex: 0xFFFCF6)
                .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                /// Today timer
                HStack(alignment: .bottom) {
                    Text(viewModel.currentTimeString)
                        .font(.system(size: 47.27, weight: .bold))
                    Text(viewModel.dayOfTheWeek)
                        .font(.system(size: 11.82, weight: .bold))
                        .padding(.bottom, 10)
                }
                
                /// Alarm slide
                HStack {
                    Button {
                        withAnimation {
                            viewModel.alarmSlideShowingButtonTouched()
                        }
                    } label: {
                        Rectangle()
                            .frame(width: 50, height: 44)
                            .foregroundColor(.init(hex: 0x2C2551))
                            .cornerRadius(17, corners: .topRight)
                            .cornerRadius(17, corners: .bottomRight)
                            .overlay {
                                Image("homeViewClock")
                            }
                    }
                    Spacer()
                }
                .background {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Spacer()
                            Spacer()
                            Text(viewModel.currentHourAndMinuteString)
                            Spacer()
                            Image(systemName: "chevron.right")
                            Spacer()
                            Toggle("알람 설정 버튼", isOn: $viewModel.isAlarmOn)
                                .labelsHidden()
                                .padding(.trailing, 16)
                        }
                        Spacer()
                        Divider()
                            .background(Color.init(hex: 0x2C2551))
                    }
                    .background(Color.init(hex: 0xF1F1F1))
                    .offset(
                        CGSize(
                            width: viewModel.isAlarmSlideShowing ? 0 : -UIScreen.screenWidth,
                            height: 0)
                    )
                }
                
                /// Gauge
                GaugeView(gauge: viewModel.gaugeValue, lineRatio: viewModel.gaugeLineRatio)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 60)
                    .background {
                        Image(viewModel.centerImageName)
                    }
                
                /// Sleep start button
                Button {
                } label: {
                    Text("취침 시작")
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 53.5)
                        .background {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(hex: 0xFFA78B))
                        }
                }
            }
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var currentTimeString = ""
    @Published var dayOfTheWeek = ""
    @Published var currentHourAndMinuteString = ""
    @Published var isAlarmSlideShowing = true
    @Published var isAlarmOn = true
    @Published var gaugeValue: Double = 0.7
    @Published var gaugeLineRatio: Double = 0.1
    @Published var centerImageName = "1"
    private let currentTimeDateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()
    private let dayOfTheWeekFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
    private let currentHourAndMinuteDateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a h : mm"
        return dateFormatter
    }()
    
    init() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addPeriodicTimeObserver), userInfo: nil, repeats: true)
    }
    
    func alarmSlideShowingButtonTouched() {
        isAlarmSlideShowing.toggle()
    }
    
    @objc private func addPeriodicTimeObserver() {
        currentTimeString = currentTimeDateFormatter.string(from: Date.now)
        dayOfTheWeek = dayOfTheWeekFormatter.string(from: Date.now)
        currentHourAndMinuteString = currentHourAndMinuteDateFormatter.string(from: Date.now)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
