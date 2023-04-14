//
//  CalenderView.swift
//  JetLagApp
//
//  Created by kwon ji won on 2023/03/31.
//

import SwiftUI

struct CalenderView: View {
    var body: some View {
        ZStack {
            Color.init(hex: 0xFFFCF6)
                .ignoresSafeArea(.all, edges: .top)
            VStack{
                HStack{
                    Image("calenderCalendar")
                    Text("근무일정")
                        .font(.system(size:20, weight: .bold))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("calenderClock")
                   
                }
                .padding(.trailing, 27)
                .padding(.leading, 18)
                .padding(.top, 67)
                HStack{
                    Text("2023 1월")
                        .font(.system(size:18, weight: .bold))
                    Spacer()
                    }
                .padding(.leading, 18)
                ZStack {
                    Color.init(hex: 0xE3E1DF)
                    
                }
                .padding(.bottom, 17.26)
                
                Button {
                } label: {
                    Text("일정 추가")
                        .font(.system(size:12.6, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical, 9)
                        .padding(.horizontal, 13.1)
                        .background {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(hex: 0x2C2551))
                        }
                }
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.init(hex: 0xB6B6B6))
                    .padding(.top, 14.35)
                HStack{
                    Text("오늘 하루")
                        .font(.system(size:15, weight: .bold))
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 18)
                Image("calenderSampleImage")
//                    .padding(.top, 18)
                    .padding(.bottom, 34)
                
                
            }
        }
    
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
