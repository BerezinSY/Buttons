//
//  ButtonView.swift
//  MKBOnline
//
//  Created by Stanislav BEREZIN on 05.07.2023.
//

import UIKit

public final class ButtonView: UIView {
    
    @IBOutlet private var labels: [UILabel]! {
        didSet {
            labels.forEach({ $0.text = "" })
        }
    }
    @IBOutlet private var templateContainer: UIView!
    @IBOutlet private var buttonSubContainer: UIView!
    
    public var tapped: (() -> Void)?
    public var titles: [String] = [] {
        didSet {
            zip(labels, titles).forEach({ $0.0.text = $0.1 })
        }
    }
    public var switched: ((Bool) -> Void)?
    
    public static var base: ButtonView? {
        Bundle.module.loadNibNamed("BaseButtonView", owner: self)?.first as? ButtonView
    }
    
    public static var primary: ButtonView? {
        Bundle.module.loadNibNamed("PrimaryButtonView", owner: self)?.first as? ButtonView
    }
    
    @IBAction private func tapped(_ sender: UIButton) {
        tapped?()
    }
    
    @IBAction private func switched(_ sender: UISwitch) {
        switched?(sender.isOn)
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
