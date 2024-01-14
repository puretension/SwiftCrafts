//
//  TabView.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

// MARK: - 03. TabView로 그려보기

struct MyTabView: View {
    var body: some View {
        TabView {
            MyTabViewDetail()
                .badge(1)
                .tabItem {
                    Image(systemName: "tray.and.arrow.down.fill")
                    Text("1 번째")
                }
            MyTabViewDetail2()
                .badge(2)
                .tabItem {
                    Image(systemName: "tray.and.arrow.down.fill")
                    Text("2 번째")
                }
            MyTabViewDetail3()
                .badge(3)
                .tabItem {
                    Image(systemName: "tray.and.arrow.down.fill")
                    Text("3 번째")
                }
//               OnBoardingView()
//                .badge(1).tabItem {
//                       Image(systemName: "2.square.fill")
//                       Text("2 번째 화면")
//                   }
//               Setting()
//                .badge("any")
//                   .tabItem {
//                       Image(systemName: "3.square.fill")
//                       Text("3 번째")
//                   }
//            Navigation()
//                .badge("!")
//                .tabItem {
//                    Image(systemName: "4.square.fill")
//                    Text("4 번째")
//                }
           }
//        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    MyTabView()
}
