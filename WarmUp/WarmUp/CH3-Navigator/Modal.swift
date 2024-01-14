//
//  Modal.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI
// MARK: - 01. Modal 띄우기(여러 화면 이동하기)

struct Modal: View {
    
    //⭐️Detail의 @Binding isPresented과 연결
    @State var showModal: Bool = false
    
    var body: some View {
        Text("메인 페이지 입니다.")
        Button {
            showModal.toggle()
        } label: {
            Text("Modal 화면 전환")
        }.sheet(isPresented: $showModal, content: {
            Detail(isPresented: $showModal)
        })
    }
}

#Preview {
    Modal()
}
