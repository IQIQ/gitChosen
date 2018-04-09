//
//  Pole_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/30/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class Pole_ViewController: UIViewController {

    
    

    //-------------------------------------lable&textField----------------------------------
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var LeadingConstaraint: NSLayoutConstraint!
    var MenuShowing = false
    //-------------------------------------ENDlable&textField----------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func ManuBar(_ sender: Any) {
        
        if(MenuShowing){
            LeadingConstaraint.constant = -200
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
        }
        else{
            LeadingConstaraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
        }
        MenuShowing = !MenuShowing
    }
    

}
