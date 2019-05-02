//
//  ContactVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/1/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit
import MessageUI


class ContactVC: UIViewController {

    
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phoneButton.layer.cornerRadius = 20
        emailButton.layer.cornerRadius = 20
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func phonePressed(_ sender: UIButton) {
        
//        let optionMenu = UIAlertController(title: nil, message: "Contact Neil", preferredStyle: .actionSheet)
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Call", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
            if let url = URL(string: "tel:16502072277"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    print("hi")
                    UIApplication.shared.open(url)
                } else {
                    print("by")
                    UIApplication.shared.openURL(url)
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Text", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit button")
            if let url = URL(string: "sms:16502072277"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })


        
    }
    
    @IBAction func emailPressed(_ sender: UIButton) {
        let email = "neilsood@umich.edu"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    
}
