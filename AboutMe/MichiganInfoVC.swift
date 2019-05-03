 //
//  MichiganInfoVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/2/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit

class MichiganInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
            dismiss(animated: true, completion: nil)
        }
    }
    
}
