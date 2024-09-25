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
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true // cuts image to corners
        return view
    }()
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .default)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
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
        
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)
        mainContainer.addSubview(menuImageView)
        menuImageView.fillSuperView()
        
        configTitleGradient()
        
        mainContainer.addSubview(titleLabel)
        titleLabel.setConstraints(
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor,
            pRight: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.normalPadding
        )
    }
    
    private func configTitleGradient() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradientMaskLayer.locations = [
            ViewValues.gradientTitleInit,
            ViewValues.gradientTitleEnd
        ]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    
    func configData(viewModel: ItemHomeMenuViewModel) {
        titleLabel.text = viewModel.title
        menuImageView.image = UIImage(named: viewModel.imageName)
    }
}

