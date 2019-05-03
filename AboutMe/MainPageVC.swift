//
//  MainPageVC.swift
//  AboutMe
//
//  Created by Neil Sood on 5/3/19.
//  Copyright © 2019 Neil Sood. All rights reserved.
//

import UIKit

class MainPageVC: UIPageViewController {
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "TitleVC"),
            self.getViewController(withIdentifier: "MichiganVC"),
            self.getViewController(withIdentifier: "Planning2GoVC"),
            self.getViewController(withIdentifier: "CodingDojoVC"),
            self.getViewController(withIdentifier: "YelpVC"),
            self.getViewController(withIdentifier: "MeVC"),
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
    }
    
    

}


extension MainPageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pages.last }
        
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
    
    
}


extension MainPageVC: UIPageViewControllerDelegate {
    
}
