//
//  Login_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/21/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
//--------------------------//use touch any where hide keyboard----------------------
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        self.dismiss(animated: false, completion: nil)
        
    }
}
//--------------------------//use touch any where hide keyboard----------------------



class Login_ViewController: UIViewController{
    

    


    //-------------------------------------value----------------------------------------------
//    var url = "http://maxosx.thddns.net:5220/Auth/Login";
//    var url2 = "http://maxosx.thddns.net:5220/Home/map";
//    var url3 = "http://maxosx.thddns.net:5220/Card";
    let blogSegueIdentifier = "Next"
    
//    var UserID : String = ""
//    var data_Latitude : [String] = ["asd"]
//    var data_Longtitude : [String] = ["bbb"]
//    var data_Pole_ID : [String] = ["ccc"]
//
//    
    //var UserFullName = ""
    var Longtitude = ""
    var Latitude = ""
    var Pole_ID = ""
    var Card_ID = ""
    
    

    
    //-------------------------------------End-value----------------------------------------------
    
    
    
    
    
    //-------------------------------------lable&textField----------------------------------
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    
    //-------------------------------------End-lable&textField----------------------------------
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StructOperation.atas.data_Latitude = []
        StructOperation.atas.data_Longtitude = []
        StructOperation.atas.data_Pole_ID = []
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 32/255, green: 149/255, blue: 215/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)

        let transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        self.activityLoader.transform = transform
        self.activityLoader.center = view.center
        self.activityLoader.hidesWhenStopped = true
        
        self.hideKeyboardWhenTappedAround()//use touch any where hide keyboard

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //var abc : [String] = []

    @IBAction func Login_Button(_ sender: Any) {
        
        let parameters: Parameters = ["username": UsernameTextField.text!, "password": PasswordTextField.text!]

        

                if (UsernameTextField.text != "" && PasswordTextField.text != ""){
                    self.activityLoader.startAnimating()

                    Alamofire.request(StructOperation.atas.url_Login,method: .post,parameters: parameters)
                .responseData { response in
                    if let data1 = response.result.value {
                        
                        
                            let json = JSON(data1)
                        print(json)
                        if (json != JSON.null)
                        {
                            let success = json[0]
                            var gUserID: String = ""
                            var gUserFullName: String = ""
                            gUserID = success["user_id"].stringValue
                            StructOperation.atas.UserID = gUserID
                            gUserFullName = success["user_fullname"].stringValue
                            print(gUserID)
                            print(gUserFullName)
                            print("Login Success")
                            
                            self.activityLoader.stopAnimating()
                            
  
                            Alamofire.request(StructOperation.atas.url_Home,method: .post,parameters: ["user_id":gUserID])
                                    .responseData { response in
                                        if let data2 = response.result.value {
                                            
                                            
                                            let json2 = JSON(data2)
                                            print(json2)
                                            var i = 0
                                            var v = 0
                                            
                                            v = json2.count
                                            
                                            while i < v {
                                                let success = json2[[i]]
                                                
                                                StructOperation.atas.UserFullName = success["user_fullname"].stringValue
                                                self.Latitude = success["lat"].stringValue
                                                self.Longtitude = success["lon"].stringValue
                                                self.Pole_ID = success["pole_id"].stringValue
                                                
                                                print("Latitude:\(self.Latitude)")
                                                print("Longtitude:\(self.Longtitude)")
                                                print("Pole\(self.Pole_ID)")
                                                print(i)
                                                
                                                StructOperation.atas.data_Latitude += [self.Latitude]
                                                StructOperation.atas.data_Longtitude += [self.Longtitude]
                                                StructOperation.atas.data_Pole_ID += [self.Pole_ID]
 
                                                i = i + 1
                                                
                                            }
                                            print(StructOperation.atas.UserFullName)
                                            print(StructOperation.atas.data_Latitude)
                                            print(StructOperation.atas.data_Longtitude)
                                            print(StructOperation.atas.data_Pole_ID)
                                  
                                            
                                            
                                           
                                            //self.performSegue(withIdentifier: self.blogSegueIdentifier, sender: Any.self)
                                        }
                                        
                                        Alamofire.request(StructOperation.atas.url_Card,method: .post,parameters: ["user_id":gUserID])
                                            .responseData { response in
                                                if let data3 = response.result.value {
                                                    let json3 = JSON(data3)
                                                    print(json3)
                                                    var j = 0
                                                    var k = 0
                                                    
                                                    k = json3.count
                                                    print("count ",k)
                                                    
                                                    while j < k {
                                                        let success = json3[[j]]
                                                        print("Succ: ",success)
                                                        
                                                        self.Card_ID = success["card_id"].stringValue
                                                        print(j)
                                                        StructOperation.atas.data_Card_ID += [self.Card_ID]
                                                        
                                                        j = j + 1
                                                        
                                                    }
                                                    print(StructOperation.atas.data_Card_ID)
                                                    
                                                    self.performSegue(withIdentifier: self.blogSegueIdentifier, sender: Any.self)
                                                }
                                        }
                                        
                            }
                            
                    
                        }
                        

                        
                        else{

                            let alert = UIAlertController(title: "Alert", message: "username password ผิด", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            
                            self.present(alert, animated: true, completion: nil)

                            print("Username Password ผิด")
                            self.activityLoader.stopAnimating()
                        }
                    }
                    else{
                        
                        let alert = UIAlertController(title: "Alert", message: "Can't Connect to Sever", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))

                        self.present(alert, animated: true, completion: nil)
                        print("don't have respound from sever")
                        
                        self.activityLoader.stopAnimating()


                    }
                    }
                    
        }else{
                        let alert = UIAlertController(title: "Alert", message: "กรุณาใส่ข้อมูล", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                        print("กรุณาใส่ข้อมูล")
                        self.activityLoader.stopAnimating()
                    }

       
}
 


}
