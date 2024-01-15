//
//  OnboardingContent.swift
//  voiceMemo
//

import Foundation

//TabView에서 사용할 것이므로 Hashable
struct OnboardingContent:Hashable {
    var imageFileName: String
    var title: String
    var subTitle: String
    
    init(imageFileName: String, title: String, subTitle: String) {
        self.imageFileName = imageFileName
        self.title = title
        self.subTitle = subTitle
    }
}
