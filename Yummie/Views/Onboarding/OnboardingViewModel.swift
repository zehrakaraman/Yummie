//
//  OnboardingViewModel.swift
//  Yummie
//
//  Created by Zehra on 20.09.2022.
//

import UIKit

protocol OnboardingViewModelButtonProtocol: AnyObject {
    func didGetStartedBtn()
    func didNextBtn()
}

final class OnboardingViewModel {
    weak var buttonDelegate: OnboardingViewModelButtonProtocol?
    
    var slides: [OnboardingSlide] = [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes rom different cultures around the world.", image: UIImage(named: "slide1")!),
        OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide2")!),
        OnboardingSlide(title: "Instant World-Wire Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")!)
    ]
    
    var currentPage: Int = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                self.buttonDelegate?.didGetStartedBtn()
            } else {
                self.buttonDelegate?.didNextBtn()
            }
        }
    }
}

