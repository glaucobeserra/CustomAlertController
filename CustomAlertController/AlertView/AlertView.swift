//
//  AlertView.swift
//  CustomAlertController
//
//  Created by Glauco Dantas Beserra on 16/07/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class AlertView: UIView, Modal {
    
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var alertButton: UIButton!
    
    var dialogView = UIView()
    var backgroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(title: String, message: String) {
        self.init(frame: UIScreen.main.bounds)
        innitialize(title, message)
        
    }
    
    private func innitialize(_ title: String, _ message: String) {
        createBackgroundView()
        guard let nibView = Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)?.first as? UIView else { return }
        dialogView = nibView
        alertTitleLabel.text = title
        alertMessageLabel.text = message
        cardBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        
        addSubview(dialogView)    
    }
    
    private func createBackgroundView() {
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 1
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
    @IBAction func alertAction(_ sender: UIButton) {
        print("Bye!")
        dismiss(animated: true)
    }
    
}
