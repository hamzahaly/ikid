//
//  PunViewController.swift
//  iKid
//
//  Created by studentuser on 11/5/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    private var punQViewController : PunQViewController!
    private var punAViewController : PunAViewController!
    
    private func firstBuilder() {
        if punQViewController == nil {
            punQViewController = storyboard?.instantiateViewController(withIdentifier: "PunQ") as! PunQViewController
        }
    }
    
    private func secondBuilder() {
        if punAViewController == nil {
            punAViewController = storyboard?.instantiateViewController(withIdentifier: "PunA") as! PunAViewController
        }
    }

    @IBAction func flipBtn(_ sender: Any) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if punQViewController != nil && punQViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punAViewController.view.frame = view.frame
            switchView(from: punQViewController, to: punAViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punQViewController.view.frame = view.frame
            switchView(from: punAViewController, to: punQViewController)
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
