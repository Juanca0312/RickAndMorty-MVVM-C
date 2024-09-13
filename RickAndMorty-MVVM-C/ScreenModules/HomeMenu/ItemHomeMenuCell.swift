//
//  ItemHomeMenuCell.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit

final class ItemHomeMenuCell: UICollectionViewCell, Reusable {    
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true // cuts image to corners
        return view
    }()
    
    private let characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .default)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Category"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(mainContainer)
        
        mainContainer.fillSuperView(widthPadding: 10)
        mainContainer.addSubview(characterImage)
        characterImage.fillSuperView()
        
        configTitleGradient()
        
        mainContainer.addSubview(titleLabel)
        titleLabel.setConstraints(
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor,
            pRight: 10,
            pBottom: 10,
            pLeft: 10
        )
    }
    
    private func configTitleGradient() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradientMaskLayer.locations = [0.6, 0.9]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
}

