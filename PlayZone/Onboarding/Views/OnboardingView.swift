//
//  OnboardingView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit
import SnapKit
import AdvancedPageControl

class OnboardingView: BaseView {
    let pageControl = AdvancedPageControlView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = AppColors.backgroundColor
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.defaultReuseIdentifier)
        return collectionView
    }()
    
    func setup() {
        pageControl.drawer = ExtendedDotDrawer(
            numberOfPages: 3, height: 7, width: 7,
            space: 10.0,
            indicatorColor: AppColors.yellowColor,
            dotsColor: AppColors.activeColor,
            isBordered: false,
            borderWidth: 0.0,
            indicatorBorderColor: .clear,
            indicatorBorderWidth: 0.0)
        
        addSubview(collectionView)
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-139)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
