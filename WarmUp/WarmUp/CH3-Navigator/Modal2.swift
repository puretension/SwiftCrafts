//
//  Modal2.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct Modal2: View {
    @State var isModal: Bool = false
    
    var body: some View {
        Text("Main Page")
        Button {
            isModal = true
        } label: {
            Text("모달 업")
        }.sheet(isPresented: $isModal, content: {
            Detail2(isPresented2: $isModal)
        })

    }
}

#Preview {
    Modal2()
}
