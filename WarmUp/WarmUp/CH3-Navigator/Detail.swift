//
//  Detail.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct Detail: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("모달 페이지 입니다.")
        Button {
            isPresented = false
        } label: {
            Text("닫기")
        }

    }
}

#Preview {
    Detail(isPresented: .constant(true))
}
