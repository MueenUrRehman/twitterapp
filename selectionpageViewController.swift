//
//  selectionpageViewController.swift
//  InstagramApp
//
//  Created by mueen on 04/05/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class selectionpageViewController: UIViewController {

    
    @IBOutlet weak var followersButton: UIButton!
    @IBOutlet weak var hashtagButton: UIButton!
    @IBOutlet weak var settingsPageButton: UIBarButtonItem!
    @IBOutlet weak var trendingHashtagsButton: UIButton!
    
    
    //let transition = SlideInTransition()
    //var topView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        followersButton.backgroundColor = .magenta
        followersButton.layer.cornerRadius = 5
        followersButton.tintColor = .black
       
        

        hashtagButton.backgroundColor = .magenta
        hashtagButton.layer.cornerRadius = 5
        hashtagButton.tintColor = .black
        
        trendingHashtagsButton.backgroundColor = .magenta
        trendingHashtagsButton.layer.cornerRadius = 5
        trendingHashtagsButton.tintColor = .black

        
        // Do any additional setup after loading the view.
    }
}
   /* @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else { return }
        
        menuViewController.didTapMenuType = { menuType in
           
            self.transitionToNew(menuType)
            
        }
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        
        present(menuViewController, animated: true)
        
    }

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView.removeFromSuperview()
        switch menuType {
        case .Privay_Policy:
            let view = UIView()
            view.backgroundColor = .lightGray
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        
        case .Rate_Us:
            let view = UIView()
            view.backgroundColor = .orange
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
            
        
        default:
            break
        }
        
    }
    
    
}

extension selectionpageViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }*/

