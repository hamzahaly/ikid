//
//  GoodViewController.swift
//  iKid
//
//  Created by studentuser on 11/5/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    private var GoodQViewController : GoodQViewController!
    private var GoodAViewController : GoodAViewController!
    
    private func firstBuilder() {
        if GoodQViewController == nil {
            GoodQViewController = storyboard?.instantiateViewController(withIdentifier: "GoodQ") as! GoodQViewController
        }
    }
    
    private func secondBuilder() {
        if GoodAViewController == nil {
            GoodAViewController = storyboard?.instantiateViewController(withIdentifier: "GoodA") as! GoodAViewController
        }
    }
    
    @IBAction func flipBtn(_ sender: UIButton) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if GoodQViewController != nil && GoodQViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            GoodAViewController.view.frame = view.frame
            switchView(from: GoodQViewController, to: GoodAViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            GoodQViewController.view.frame = view.frame
            switchView(from: GoodAViewController, to: GoodQViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchView(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
