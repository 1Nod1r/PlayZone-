//
//  ViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 15/09/22.
//

import UIKit

class OnboardingViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = OnboardingView
    let viewModel = OnboardingViewModel()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    
    override func loadView() {
        super.loadView()
        view = OnboardingView()
    }
    
    private func configureSettings(){
        mainView().collectionView.delegate = self
        mainView().collectionView.dataSource = self
    }

    @objc func scrollToNext(){
        if currentIndex < viewModel.getModel() - 1 {
            mainView().collectionView.scrollToNextItem()
        } else  {
            let navVC = UINavigationController(rootViewController: LoginViewController())
            navVC.modalPresentationStyle = .overFullScreen
            navVC.setNavigationBarHidden(true, animated: false)
            navigationController?.present(navVC, animated: true)
            UserDefaults.standard.setOnboarded()
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mainView().frame.width, height: mainView().frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getModel()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        let model = viewModel.model[indexPath.row]
        cell.configure(with: model)
        cell.nextButton.addTarget(self, action: #selector(scrollToNext), for: .touchUpInside)
        mainView().pageControl.setPage(currentIndex)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let page = Float64(round(offSet / width))
        guard !(page.isNaN || page.isInfinite) else { return }
        let pageInt = Int(page)
        currentIndex = pageInt
        mainView().pageControl.setPage(pageInt)
    }
    
}
