//
//  MainViewModel.swift
//  MVVM
//
//  Created by Денис Холодков on 03.10.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set } // update будет происходить через клоужер
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())?

    init() {
        updateViewData?(.initial)
    }

    func startFetch() {
        // start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                         title: "Success",
                                                         description: "Good",
                                                         numberPhone: nil)))
            // с паузой в 3 секунды выдается сообщение об успехе через клоужер
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         title: "Error",
                                                         description: "Not User",
                                                         numberPhone: nil)))
            // с паузой в 3 секунды выдается сообщение об ошибке через клоужер

        }
    }
}
