//
//  BaseViewController.swift
//  AnimationPractice
//
//  Created by koala panda on 2023/07/17.
//

import UIKit

class BaseViewController: UIViewController {


    @IBAction func showHalfModal(_ sender: Any) {
        guard let halfModalVC = UIStoryboard(name: "HalfModal", bundle: nil).instantiateInitialViewController() as?
                HalfModalViewController else {
            return
    }
    halfModalVC.modalPresentationStyle = .overCurrentContext
        halfModalVC.modalTransitionStyle = .crossDissolve

        present(halfModalVC, animated: false, completion: {
            halfModalVC.showMadal(isAnimation: true)
        })
    }
}
