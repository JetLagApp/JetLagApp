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
        HStack(alignment: .bottom) {
            Text(viewModel.currentTimeString)
                .font(.system(size: 47.27, weight: .bold))
            Text(viewModel.dayOfTheWeek)
                .font(.system(size: 11.82, weight: .bold))
                .padding(.bottom, 10)
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var currentTimeString = ""
    @Published var dayOfTheWeek = ""
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
    
    init() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addPeriodicTimeObserver), userInfo: nil, repeats: true)
    }
    
    @objc private func addPeriodicTimeObserver() {
        currentTimeString = currentTimeDateFormatter.string(from: Date.now)
        dayOfTheWeek = dayOfTheWeekFormatter.string(from: Date.now)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
