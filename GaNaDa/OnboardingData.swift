//
//  OnboardingData.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/26.
//

import Foundation


struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, backgroundImage: "gyeongbokgung-palace", objectImage: "king", primaryText: "How well do you know Korean?", secondaryText: "Until now, it was not easy to learn Korean. But what about with GaNaDa?"),
        OnboardingData(id: 1, backgroundImage: "south-korea", objectImage: "student", primaryText: "Learn", secondaryText: "간단한 게임으로 다양한 한국어를 학습 해보세요"),
        OnboardingData(id: 2, backgroundImage: "onboarding-bg-3", objectImage: "onboarding-object-3", primaryText: "블라블라블ㄹ", secondaryText: "블라블라블라 아직 뭘 쓸지 못정함")
    ]
}
