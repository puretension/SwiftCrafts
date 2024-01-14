//
//  TabView.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        TabView {
               // 첫 번째 탭
               Text("첫 번째 화면")
                   .tabItem {
                       Image(systemName: "1.square.fill")
                       Text("첫 번째")
                   }
               
               // 두 번째 탭
               Text("두 번째 화면")
                   .tabItem {
                       Image(systemName: "2.square.fill")
                       Text("두 번째")
                   }
               
               // 세 번째 탭
               Text("세 번째 화면")
                   .tabItem {
                       Image(systemName: "3.square.fill")
                       Text("세 번째")
                   }
           }
    }
}

#Preview {
    TabView()
}
