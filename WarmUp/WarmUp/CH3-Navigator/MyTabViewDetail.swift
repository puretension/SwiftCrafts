//
//  MyTabViewDetail.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct MyTabViewDetail: View {
    var body: some View {
        //Z축, 즉 화면에 대해 수직 방향
        //, 배경 위에 텍스트를 놓거나 이미지 위에 버튼을 놓는 등의 UI를 구성할 때(Flutter-Stack)
        ZStack{
            //safeArea 무시
            Color.gray.ignoresSafeArea()
            Text("This is Detail")
        }
    }
}

struct MyTabViewDetail2: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("This is Detail2")
                
                Button {
                } label: {
                    Text("Continue")
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }

            }
        }
    }
}

struct MyTabViewDetail3: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Text("This is Detail3")
        }
    }
}

#Preview {
    MyTabViewDetail()
}
