//
//  LayoutView.swift
//  WarmUp
//
//  Created by 이도형 on 1/13/24.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        // MARK: - 03. 레이아웃 잡기(레이아웃 실습⭐️)
        
        Image(systemName: "pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
        
        Text("Text Element 1")
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 20)
        
        Text("Text Element 2")
            .font(.title3)
            .fontWeight(.regular)
            .padding()
        
        Text("Text Element 3")
            .font(.title3)
            .fontWeight(.regular)
            .padding()
        
        HStack(content: {
            
//            Button("Button 1"){//action skip}
//                .frame(width: 100,height: 50)
//                .foregroundColor(.white)
//                .background(.blue)
//                .cornerRadius(10)
//                .bold()
            
//            Button("Button 2"){}
//                .padding() // Useful
//                .background(.green)
//                .foregroundColor(.white)
//                .cornerRadius(10)
            // ⭐️Optinal 타입파라미터 받는 MyButton으로 컴포넌트 빼서 사용
            MyButton(buttonColor: .blue)
            MyButton(buttonTitle: "Button 2", buttonColor: .green)
        })
        
        Button(action: {
            // 버튼 클릭 시 수행할 동작
        }) {
            VStack {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .background(.orange)
                Text("Complex Button")
            }
        }.frame(width: 180,height: 130)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(10)
    }
}

#Preview {
    LayoutView()
}
