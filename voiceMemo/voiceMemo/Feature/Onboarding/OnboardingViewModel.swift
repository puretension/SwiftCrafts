//
//  OnboardingViewModel.swift
//  voiceMemo
//

import Foundation

//View에서 @StateObject, @ObservedObject를 주로 사용해야하므로
//ObservableObject를 채택해준다
class OnboardingViewModel: ObservableObject {
    //ObservableObject를 구현한 클래스 내에서 프로퍼티 선언시 사용
    //@Published 선언된 프로퍼티를 View에서 관찰 가능
    //ObservableObject의 ObjectWillChange.send() 기능을 @Published 프로퍼티가 변경되면 자동으로 호출함
    @Published var onboardingContents: [OnboardingContent]
    
//    init(onboardingContents: [OnboardingContent]) {
//        self.onboardingContents = onboardingContents
//    }
    
    init(onboardingContents: [OnboardingContent] = [
        .init(
            imageFileName: "onboarding_1",
            title: "오늘의 할일",
            subTitle: "To do List로 언제 어디서든 해야할 일을 한눈에!"
        ),
        .init(
            imageFileName: "onboarding_2",
            title: "똑똑한 나만의 기록장",
            subTitle: "메모장으로 생각나는 기록은 언제든지!"
        ),
        .init(
            imageFileName: "onboarding_3",
            title: "하나라도 놓치지 않도록",
            subTitle: "음성메모 기능으로 놓치고 싶지않은 기록까지!"),
        .init(
            imageFileName: "onboarding_4",
            title: "정확한 시간의 결과",
            subTitle: "타이머 기능으로 원하는 시간을 확인")
        
    ]) {
        self.onboardingContents = onboardingContents
    }
}
