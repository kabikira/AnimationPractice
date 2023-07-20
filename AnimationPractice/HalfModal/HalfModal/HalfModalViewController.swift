//
//  HalfModalViewController.swift
//  AnimationPractice
//
//  Created by koala panda on 2023/07/17.
//

import UIKit

class HalfModalViewController: UIViewController {

    @IBOutlet private weak var slideViewCenterYConstraint: NSLayoutConstraint!

    @IBOutlet private weak var topBarView: UIView! {
        didSet {
            topBarView.layer.cornerRadius = topBarView.frame.size.height / 2
            topBarView.clipsToBounds = true
        }
    }

    @IBOutlet private weak var slideView: UIView! {
        didSet {
            let t = UITapGestureRecognizer(target: self, action:#selector(tapSideView) )
            slideView.addGestureRecognizer(t)
        }
    }

    @IBOutlet private weak var halfMainViewHeightConstraint: NSLayoutConstraint!


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func dismissModal(isAnimation: Bool = true) {
        slideViewCenterYConstraint.constant = view.frame.height / 2

        if isAnimation {
            UIView.animate(withDuration: 0.2, animations:{ self.view.layoutIfNeeded()
            }) { _ in
                self.dismiss(animated: true)
            }
        } else {
            dismiss(animated: true)
        }
    }

    func showMadal(isAnimation: Bool = true) {
        slideViewCenterYConstraint.constant = 0
        if isAnimation {
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        } else {
            view.layoutIfNeeded()
        }
    }
}

private extension HalfModalViewController {

    @IBAction func tapNobiro(_ sender: Any) {
        nobiro()
    }
    @IBAction func tapChijime(_ sender: Any) {
        chijime()
    }

    @objc func tapSideView() {
        dismissModal(isAnimation: true)
    }
}

private extension HalfModalViewController {
    func setDefaulPositon() {
        slideViewCenterYConstraint.constant = view.frame.height / 2
        halfMainViewHeightConstraint.constant = 300
        view.layoutIfNeeded()
    }
    func nobiro() {
        halfMainViewHeightConstraint.constant = view.frame.height * 0.8
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    func chijime() {
        halfMainViewHeightConstraint.constant = 300
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
