//
//  AlertView.swift
//  CustomAlertController
//
//  Created by Glauco Dantas Beserra on 16/07/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class AlertView: UIView, Modal {
    
    // MARK: Outlets
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var alertButton: UIButton!
    
    // MARK: - Properties
    var dialogView = UIView()
    var backgroundView = UIView()
    
    // MARK: - Initialization
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
    
    // MARK: - Methods
    private func innitialize(_ title: String, _ message: String) {
        createBackgroundView()
        dialogView = loadNib()
        
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
    
    @objc private func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
    // MARK: - Actions
    @IBAction func alertAction(_ sender: UIButton) {
        print("Bye!")
        dismiss(animated: true)
    }
    
}
