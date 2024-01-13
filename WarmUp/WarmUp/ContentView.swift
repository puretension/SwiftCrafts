//
//  ContentView.swift
//  WarmUp
//
//  Created by 이도형 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // MARK: - 01. 코딩 없이 화면 그리기

//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//                
//            Text("Hello, world!")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.purple)
//                .padding()
            
//             MARK: - 02. 간단한 화면에 필요한 요소들 손대보기
//
//            Modifier의 순서에 상관있는게 있으므로 유의하자!
            
            //Image는 resizable(), scaledToFit후에 W/H 셋팅!⭐️
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200.0, height: 200.0)
            
            Text("헤드라인 입니다.")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
            
            Text("서브헤드라인 입니다")
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 30)
                .padding(.top, 15)
            
            Text("바디 입니다.")
                .font(.body)
                .padding(.vertical, 10)
            
            Button("Click Me") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .frame(width: 90.0, height: 40.0) //button은 frame부터 잡자!(Modifier 순서!)
            .foregroundColor(.white)
            .background(.blue)
//            .padding(.all, 10.0) -> Modifier의 순서
            .cornerRadius(10.0)
            .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

