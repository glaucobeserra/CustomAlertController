//
//  Modal.swift
//  CustomAlertController
//
//  Created by Glauco Dantas Beserra on 16/07/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

protocol Modal {
    var dialogView: UIView { get set }
    var backgroundView: UIView { get }
    
    func show(animated: Bool)
    func dismiss(animated: Bool)
}

extension Modal where Self:UIView{
    func show(animated:Bool){
        self.backgroundView.alpha = 0
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.view.addSubview(self)
        }
        if animated {
            dialogView.center  = center
            UIView.animate(withDuration: 0.33,
                           animations: {
                            self.backgroundView.alpha = 0.66
            })
            dialogView.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveLinear,
                           animations: {
                            self.dialogView.transform = .identity
            }, completion: nil)
        } else {
            self.backgroundView.alpha = 0.66
            self.dialogView.center  = self.center
        }
    }
    
    func dismiss(animated:Bool){
        if animated {
            UIView.animate(withDuration: 0.33,
                           animations: {
                            self.backgroundView.alpha = 0
            }, completion: { (completed) in
            })
            UIView.animate(withDuration: 0.33,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseInOut,
                           animations: {
                            self.dialogView.center = CGPoint(x: self.center.x, y: self.frame.height + self.dialogView.frame.height/2)
            }, completion: { (completed) in
                self.removeFromSuperview()
            })
        } else{
            self.removeFromSuperview()
        }
    }
}
