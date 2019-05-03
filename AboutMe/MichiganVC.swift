//
//  MichiganVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/1/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit
import CoreMotion

class MichiganVC: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var bottomArrowImageView: UIImageView!
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var leftArrowImageView: UIImageView!
    
    // VARIABLES FOR COREMOTION
    let motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    var neutral = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            
            // CORE MOTION
            if self.motionManager.isDeviceMotionAvailable {
                print("We can detect device motion")
                // set read speed
                self.motionManager.deviceMotionUpdateInterval = 0.5
                // start reading
                self.motionManager.startDeviceMotionUpdates(to: self.opQueue) {
                    (data: CMDeviceMotion?, error: Error?) in
                    
                    if let mydata = data {
    //                    print(mydata.gravity)
                        if mydata.gravity.y >= 0.60 {
                            print("1")
                            self.moveImage(self.logoImageView, "backward")
                        }
                        if mydata.gravity.x <= -0.60 {
                            print("2")
                            self.moveImage(self.logoImageView, "left")
                        }
                        if mydata.gravity.x >= 0.60 {
                            print("3")
                            self.moveImage(self.logoImageView, "right")
                        }
                        if mydata.gravity.y <= -0.60 {
                            print("4")
                            self.moveImage(self.logoImageView, "forward")
                        }
                    }
                }
            }
            else {
                print("We cannot detect device motion")
            }
            
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
            }
        }
        
        // SWIPE RECOGNIZERS
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
//            self.popViewController(animated: true)

        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            performSegue(withIdentifier: "ToPlanning2GoSegue", sender: self)
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
//            performSegue(withIdentifier: "ToContactSegue", sender: self)
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
        }
    }

    func degrees(_ radians: Double) -> Double {
        return 180/Double.pi * radians
    }
    
    func moveImage(_ img: UIImageView, _ name: String) {
        if name == "left" {
            self.logoImageView.frame.origin.x += 1
        }
        else if name == "right" {
            self.logoImageView.frame.origin.x -= 1
        }
        else if name == "forward" {
            self.logoImageView.frame.origin.y += 1
        }
        else if name == "backward" {
            self.logoImageView.frame.origin.y -= 1
        }
        
    }

}
