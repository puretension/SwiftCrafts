//
//  Detail2.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct Detail2: View {
    @Binding var isPresented2: Bool
    var body: some View {
        Text("Detail Page")
        Button {
            isPresented2 = false
        } label: {
            Text("Detail Down")
        }

    }
}

#Preview {
    Detail2(isPresented2: .constant(true))
}
