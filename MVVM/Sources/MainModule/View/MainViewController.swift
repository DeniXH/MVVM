//
//  ViewController.swift
//  MVVM
//
//  Created by Денис Холодков on 03.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!

    override func viewDidLoad() {
        viewModel = MainViewModel() // сделать через инъекцию зависимостей!!!
        super.viewDidLoad()

        createView()
        updateView()
    }


    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

// в MVVM и MVP - вью может только отрисовывать и принмать эвенты

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
}

