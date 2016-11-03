//
//  HamburgerViewController.swift
//  YouTubeNaviDemo
//
//  Created by Samihah Azim on 11/2/16.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var feedView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    var feedViewOriginalCenter: CGPoint!
    
    var feedViewPanGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        feedViewOriginalCenter = feedView.center
        
        //Menu VC
        menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        addChildViewController(menuViewController)
        menuView.addSubview(menuViewController.view)
        menuViewController.view.frame = menuView.bounds
        menuViewController.didMove(toParentViewController: self)
        
        //Feed VC
        
        feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController")
        addChildViewController(feedViewController)
        feedView.addSubview(feedViewController.view)
        feedViewController.view.frame = feedView.bounds
        feedViewController.didMove(toParentViewController: self)
        
        feedViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(HamburgerViewController.didPanFeed(_:)))
        feedView.addGestureRecognizer(feedViewPanGesture)
        feedViewPanGesture.isEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    func didPanFeed(_ sender: UIPanGestureRecognizer) {
        var translation_x = sender.translation(in: contentView).x
        var location_x = sender.location(in: contentView).x
        var velocity_x = sender.velocity(in: contentView).x
        let initialMenuTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        
        //begins
        if sender.state == UIGestureRecognizerState.began {
            
        //changes happen here
        } else if sender.state == UIGestureRecognizerState.changed {

            if translation_x > 0 {
                feedView.center.x = feedViewOriginalCenter.x + translation_x
            }
            
            else if translation_x < 0 && feedView.center.x > feedViewOriginalCenter.x {
                feedView.center.x = feedViewOriginalCenter.x + 290 + translation_x
            }

            
        }
        //state ends here..and doesn't work for animations
        else if sender.state == UIGestureRecognizerState.ended {
            if velocity_x > 0 {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.feedView.center = CGPoint(x: self.feedViewOriginalCenter.x + 290, y: self.feedViewOriginalCenter.y)
                    //this shit doesn't work
                    self.menuView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            }
            else if velocity_x < 0 {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.feedView.center = CGPoint(x: self.feedViewOriginalCenter.x, y: self.feedViewOriginalCenter.y)
                    
                    //this doesn't work either
                    self.menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        // Dispose of any resources that can be recreated.
    }
    


}
