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

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func loadView() {
        super.loadView()
        view = OnboardingView()
    }
    
    private func configureSettings(){
        rootView().collectionView.delegate = self
        rootView().collectionView.dataSource = self
    }

    @objc func scrollToNext(){
        if currentIndex < viewModel.getModel() - 1 {
            rootView().collectionView.scrollToNextItem()
        } else  {
            let vc = UINavigationController(rootViewController: LoginViewController())
            vc.modalPresentationStyle = .overFullScreen
            navigationController?.present(vc, animated: true)
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: rootView().frame.width, height: rootView().frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getModel()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        let model = viewModel.model[indexPath.row]
        cell.configure(with: model)
        cell.nextButton.addTarget(self, action: #selector(scrollToNext), for: .touchUpInside)
        rootView().pageControl.setPage(currentIndex)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let page = Float64(round(offSet / width))
        guard !(page.isNaN || page.isInfinite) else { return }
        let pageInt = Int(page)
        currentIndex = pageInt
        rootView().pageControl.setPage(pageInt)
    }
    
}
