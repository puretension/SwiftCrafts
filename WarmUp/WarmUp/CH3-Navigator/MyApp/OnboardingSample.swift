//
//  OnboardingList.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

//import SwiftUI
//
//
//struct OnboardingSample: View {
//    
//    let title: String? = "Onboarding Test"
//    
//    var body: some View {
//        ZStack{
//            Color.blue.ignoresSafeArea()
//            Text("\(title!)")
//        }
//    }
//}
//
//#Preview {
//    OnboardingSample()
//}

// MARK: - Optinal Parameter로 디폴트 값 있는 상태로!


import SwiftUI

struct OnboardingSample: View {
    let title: String
    let backgroundColor: Color
    @Binding var showModal: Bool? //Optional로

    // ⭐️
    init(title: String? = "Onboarding Test",
         backgroundColor: Color? = .blue,
         // Optional로
         showModal: Binding<Bool?>? = nil) {
        self.title = title ?? "Onboarding Test"
        self.backgroundColor = backgroundColor ?? .blue
        //if let Binding
        // showModal이 nil이 아니라 실제로 값이 있는 경우, 이 코드 블록이 실행
        if let showModal = showModal {
            //backing property => 언더바varname
               self._showModal = showModal
           } else {
               //showModal 파라미터가 nil인 경우
               self._showModal = .constant(nil) // Default binding
           }
    }
    
    var body: some View {
            ZStack {
                backgroundColor.ignoresSafeArea()
                VStack {
                    Text(title)
                    if showModal != nil {
                        Button(action: {
                            self.showModal = false
                        }, label: {
                            Text("Start")
                                .font(.body)
                                .foregroundColor(Color.white)
                        })
                    }
                }
            }
        }
    }

struct OnboardingSample_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSample() // 'showModal'이 제공되지 않음
        OnboardingSample(title: "Custom Title", backgroundColor: .red) // 'title'과 'backgroundColor'를 커스텀 값으로 제공
        // 'showModal'이 필요한 경우에 대한 예시가 필요하다면, 다음과 같이 추가할 수 있습니다.
        OnboardingSample(title: "With showModal", showModal: .constant(true))
    }
}
