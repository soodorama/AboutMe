//
//  TitleVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/1/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit

class TitleVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeLeft.direction = .left
//        self.view.addGestureRecognizer(swipeLeft)
//
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeDown.direction = .down
//        self.view.addGestureRecognizer(swipeDown)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let _ = segue.destination as? MichiganVC{
//            let trans = CATransition()
//            trans.type = CATransitionType.moveIn
//            trans.subtype = CATransitionSubtype.fromLeft
//            trans.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            trans.duration = 5
//            self.view.layer.add(trans, forKey: nil)
//        }
//    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
//        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
//            print("Swipe Right")
//        }
//        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
//            print("Swipe Left")
//            performSegue(withIdentifier: "ToMichiganSegue", sender: self)
//        }
        if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
            performSegue(withIdentifier: "ToContactSegue", sender: self)
        }
//        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
//            print("Swipe Down")
//        }
    }
    
    
//    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) { }

}

