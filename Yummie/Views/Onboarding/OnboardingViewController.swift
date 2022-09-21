//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Zehra on 20.09.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.buttonDelegate = self
        
        pageControl.numberOfPages = viewModel.slides.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.backgroundColor = .white
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if viewModel.currentPage == viewModel.slides.count - 1 {
            performSegue(withIdentifier: "toHome", sender: nil)
        } else {
            viewModel.currentPage += 1
            let indexPath = IndexPath(item: viewModel.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true )
        }
    }
    
    @IBAction func skipBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "toHome", sender: nil)
    }
    
}

// paging enabled
// min spacing

// user interaction enabled - page control

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        let slide = viewModel.slides[indexPath.row]
        cell.setup(slide)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: collectionView.frame.width, height: collectionView.frame.height))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width
        viewModel.currentPage = Int(scrollView.contentOffset.x / witdh)
        pageControl.currentPage = viewModel.currentPage
    }
    
}

extension OnboardingViewController: OnboardingViewModelButtonProtocol {
    
    func didGetStartedBtn() {
        self.nextBtn.setTitle("Get Started", for: .normal)
    }
    
    func didNextBtn() {
        self.nextBtn.setTitle("Next", for: .normal)
    }
    
}
