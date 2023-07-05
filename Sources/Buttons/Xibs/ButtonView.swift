//
//  ButtonView.swift
//  MKBOnline
//
//  Created by Stanislav BEREZIN on 05.07.2023.
//

import UIKit

class ButtonView: UIView {
    
    @IBOutlet private var labels: [UILabel]!
    @IBOutlet private var templateContainer: UIView!
    @IBOutlet private var buttonSubContainer: UIView!
    
    static var base: ButtonView? {
        Bundle.module.loadNibNamed("BaseButtonView", owner: self)?.first as? ButtonView
    }
    
    static var primary: ButtonView? {
        Bundle.module.loadNibNamed("PrimaryButtonView", owner: self)?.first as? ButtonView
    }
    
    @IBAction private func tapped(_ sender: UIButton) {
        
    }
    
    @IBAction private func switched(_ sender: UISwitch) {
        
    }
    
    @IBAction private func touchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.buttonSubContainer.alpha = 0.5
        }
    }
    
    @IBAction private func touchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.buttonSubContainer.alpha = 1.0
        }
    }
}
