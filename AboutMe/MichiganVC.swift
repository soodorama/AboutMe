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
    let manager = CMMotionManager()
    let interval = 0.005
    let imageFilename = "um_logo_um_blue_border.png"
    let imageWidth = CGFloat(256)
    let imageHeight = CGFloat(256)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CORE MOTION
        guard manager.isDeviceMotionAvailable else { return }
        
        setImageView()
        
        manager.deviceMotionUpdateInterval = interval
        let queue = OperationQueue()
        
        manager.startDeviceMotionUpdates(to: queue, withHandler: {(data, error) in
            guard let data = data else { return }
            let gravity = data.gravity
            let rotation = atan2(gravity.x, gravity.y) - .pi
            
            OperationQueue.main.addOperation {
                self.logoImageView?.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
            }
        })
        
//        motionManager.startAccelerometerUpdates()
        
//        if let data = motionManager.accelerometerData {
//            print(data)
//            if (fabs(data.acceleration.x) > 0.2) {
//                print("test")
//                self.logoImageView.frame.origin.x += 1
//            }
//        }
        
        // SWIPE RECOGNIZERS
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
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
//        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
//            print("Swipe Right")
//            dismiss(animated: true, completion: nil)
//
//        }
//        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
//            print("Swipe Left")
//            performSegue(withIdentifier: "ToPlanning2GoSegue", sender: self)
//        }
        if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
            performSegue(withIdentifier: "ToMichiganInfoVC", sender: self)
        }
//        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
//            print("Swipe Down")
//        }
    }

//    func degrees(_ radians: Double) -> Double {
//        return 180/Double.pi * radians
//    }
    
//    func moveImage(_ img: UIImageView, _ name: String) {
//        if name == "left" {
//            self.logoImageView.frame.origin.x += 1
//        }
//        else if name == "right" {
//            self.logoImageView.frame.origin.x -= 1
//        }
//        else if name == "forward" {
//            self.logoImageView.frame.origin.y += 1
//        }
//        else if name == "backward" {
//            self.logoImageView.frame.origin.y -= 1
//        }
//
//    }
    
    func setImageView() {
        if let img = UIImage(named: imageFilename) {
            let iv = UIImageView(image: img)
            
            // center the image
            let x = (self.view.frame.width/2)-(imageWidth/2)
            let y = (self.view.frame.height/2)-(imageHeight/2)
            iv.frame = CGRect(x: x, y: y, width: imageWidth, height: imageHeight)
            
            self.view.addSubview(iv)
            self.logoImageView = iv
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let _ = segue.destination as? TitleVC{
//            let trans = CATransition()
//            trans.type = CATransitionType.moveIn
//            trans.subtype = CATransitionSubtype.fromLeft
//            trans.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            trans.duration = 1
//            self.view.layer.add(trans, forKey: nil)
//        }
//
//    }

}
