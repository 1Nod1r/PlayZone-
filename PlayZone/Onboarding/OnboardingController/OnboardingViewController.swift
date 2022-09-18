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
    
    private(set) lazy var coordinator: AuthorizationCoordinator? = {
        guard let navigationController = navigationController else { return  nil}
        let coordinator = AuthorizationCoordinator(navigationController: navigationController)
        return coordinator
    }()
    
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
            coordinator?.start()
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
