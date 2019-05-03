//
//  Planning2GoVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/1/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit

class Planning2GoVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    let imageWidth = CGFloat(256)
    let imageHeight = CGFloat(256)
    let screenSize = UIScreen.main.bounds
    let edgeSpacing = CGFloat(48)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let position = touch.location(in: view)
//            let screenWidth = screenSize.width
//            let screenHeight = screenSize.height
//
//            if position.x > edgeSpacing && position.x < screenWidth - edgeSpacing - imageWidth && position.y < screenHeight - edgeSpacing - imageHeight {
//                print("cannot move there")
//            }
//            else {
//                logoImageView.frame.origin.x = position.x - imageWidth / 2
//                logoImageView.frame.origin.y = position.y - imageHeight / 2
//            }
//        }
//    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
//            print(screenHeight)
            let totalSpacing = edgeSpacing + imageWidth / 2
//            print(position)
            
            if position.x > 80 && position.x < screenWidth - 80 {
                logoImageView.frame.origin.x = position.x - imageWidth / 2
            }
            if position.y < screenHeight - 80 && position.y > 80 {
                logoImageView.frame.origin.y = position.y - imageHeight / 2
            }
        }
    }

}
