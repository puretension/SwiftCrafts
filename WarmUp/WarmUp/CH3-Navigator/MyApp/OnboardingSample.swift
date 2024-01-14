//
//  OnboardingList.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI


struct OnboardingSample: View {
    
    let title: String
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            Text("\(title)")
        }
    }
}

#Preview {
    OnboardingSample(title: "Onboarding Test")
}
