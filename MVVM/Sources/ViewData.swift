//
//  ViewData.swift
//  MVVM
//
//  Created by Денис Холодков on 03.10.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)

    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}

// в этом энам описано поведение view, т.е. состояния, которые она будет принимать
