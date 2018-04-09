//
//  ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/15/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    


    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        //Func_ViewController().DelaySwitch() //------------ใช้ได้------------
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
//            self.functionToCall()
            
            //Func_ViewController().goNext()
            self.goNextS()


        })
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func goNextS(){

        self.performSegue(withIdentifier: "Login", sender: self)
        //self.performSegueWithIdentifier("LogoutItem1", sender: self)

        //self.navigationController?.pushViewController(Login_ViewController, animated: true)
    }

}

