//
//  FirstList.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct FirstList: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink {
                    Text("첫 번째 하위페이지입니다.")
                } label: {
                    Text("첫 번째 하위페이지")
                }
                NavigationLink {
                    Text("두 번째 하위페이지입니다.")
                } label: {
                    Text("두 번째 하위페이지")
                }
                NavigationLink {
                    Text("세 번째 하위페이지입니다.")
                } label: {
                    Text("세 번째 하위페이지")
                }
                NavigationLink {
                    Text("네 번째 하위페이지입니다.")
                } label: {
                    Text("네 번째 하위페이지")
                }
                
//                    Text("첫 번째 하위페이지")
//                    Text("두 번째 하위페이지")
//                    Text("세 번째 하위페이지")
//                    Text("네 번째 하위페이지")
            }.navigationTitle("리스트")
        }
    }
}

#Preview {
    FirstList()
}
