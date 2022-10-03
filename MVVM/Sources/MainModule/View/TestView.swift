//
//  TestView.swift
//  MVVM
//
//  Created by Денис Холодков on 03.10.2022.
//

import UIKit


// MARK: класс для обработки состояния

class TestView: UIView {

// MARK: - обработчик ViewData, т.е. приходящих данных

    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout() // когда приходит изменения, то нужно перерисовать
        }
    }

// MARK: - создание UI элементов

    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()

    override func layoutSubviews() {
        super.layoutSubviews()

        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true) // прячем все лэйблы
            activityIndicator.isHidden = true
            activityIndicator.startAnimating()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.startAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.startAnimating()
        }
    }

    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "") // какой image прийдет в такой и превратится
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        imageView.isHidden = isHidden
    }
}
