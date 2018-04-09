//
//  MyCard_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/24/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit






class MyCard_ViewController: UIViewController{//,UITableViewDelegate,UITableViewDataSource {

//-------------------------------------lable&textField----------------------------------
    
    @IBOutlet weak var LeadingConstaraint: NSLayoutConstraint!
    var MenuShowing = false
    @IBOutlet weak var MenuView: UIView!

    //-------------------------------------Endlable&textField----------------------------------


    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

   

    @IBAction func Menubar(_ sender: Any) {
        
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
