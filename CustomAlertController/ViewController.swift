//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Glauco Dantas Beserra on 16/07/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alert = AlertView(title: "Lorem ipsum error",
                              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ornare quam sit amet sagittis feugiat. ")
        alert.show(animated: true)
    }
    
}

