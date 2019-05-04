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
    
    // touchesMoved works if you remove UIPageViewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
//            print(screenHeight)
            let totalSpacing = edgeSpacing + imageWidth / 2
//            print(position)
            
            if position.x > imageWidth / -2 && position.x < screenWidth + imageWidth / 2 {
                logoImageView.frame.origin.x = position.x - imageWidth / 2
            }
            if position.y < screenHeight + imageHeight / 2 && position.y > imageHeight / -2 {
                logoImageView.frame.origin.y = position.y - imageHeight / 2
            }
        }
    }

}
