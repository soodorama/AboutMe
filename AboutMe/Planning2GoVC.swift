//
//  Planning2GoVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/1/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit

class Planning2GoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            dismiss(animated: true, completion: nil)
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            performSegue(withIdentifier: "ToCodingDojoSegue", sender: self)
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
        }
    }
    

}
