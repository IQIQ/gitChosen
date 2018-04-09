//
//  Func_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/21/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import Charts

protocol controlFunc {
    
    func goNext()
    func DelaySwitch()
    
    
}
extension PaymentChanal {
    init?(json: JSON) {
        self.card_id = json["card_id"].stringValue
        
    }
}
struct PaymentChanal {
    let card_id : String
}

class StructOperation {
    struct atas {
        //static var userName = String();
        
        static var data_Pole_ID = [String]()
        static var data_Card_ID = [String]()
        //------MAP-------------
        static var UserID = String()
        static var UserFullName = String()
        static var data_Latitude = [String]()
        static var data_Longtitude = [String]()
        
        //---------------table----------------------
        static var getData_Transaction_id = [String]()
        static var getData_Pole_ID = [String]()
        static var getData_Card_ID = [String]()
        static var getData_Meterstartdate = [String]()
        static var getData_Metereinddate = [String]()
        static var getData_Price = [String]()
        static var getData_Total = [String]()
        static var getData_Totalprice = [String]()
        
        //----------------------- Chart------------------------
        static var idPieChart = [String]()
        static var DataDoublePieChart = [Double]()
        
        static var idBarChart = [String]()
        static var DataDoubleBarChart = [[Any]]()
        //----------------------- Chart------------------------
        
        //----------------------- test------------------------
        static var tetst = [String]()
      
        //----------------------- test------------------------
        
        

//        static var url = "http://maxosx.thddns.net:5220"
//        static var url_Login = "http://maxosx.thddns.net:5220/Auth/Login";
//        static var url_Home = "http://maxosx.thddns.net:5220/Home/map";
//        static var url_Card = "http://maxosx.thddns.net:5220/Card";
        
        //static var url = "http://171.4.219.99:81"
        
        static var url = "http://app.chosenenergy.co.th/"
        
        static var url_Login: String = url+"/Auth/Login"
        static var url_Home: String = url+"/Home/map"
        static var url_Card: String = url+"/Card"
        static var url_Report: String = url+"/Report/report"
   
    
        static var alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    }

    
}

//----------------------------show Label X BarChart -----------------------
class CustomLabelsAxisValueFormatter : NSObject, IAxisValueFormatter {
    
    var labels: [String] = []
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        let count = self.labels.count
        
        guard let axis = axis, count > 0 else {
            
            return ""
        }
        
        let factor = axis.axisMaximum / Double(count)
        
        let index = Int((value / factor).rounded())
        
        if index >= 0 && index < count {
            
            return self.labels[index]
        }
        
        return ""
    }
}
//----------------------------show Label X BarChart -----------------------




class Func_ViewController: UIViewController,controlFunc {
    
    var delegate: controlFunc?


    override func viewDidLoad() {
        super.viewDidLoad()
        //var _: controlFunc?
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

        
    
    
    @objc func goNext(){
        
        self.performSegue(withIdentifier: "Login", sender: self)
        //self.performSegueWithIdentifier("LogoutItem1", sender: self)
        
        //self.navigationController?.pushViewController(Login_ViewController, animated: true)
    }
    func DelaySwitch()
    {
    
        
        let a = "Login"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
    //self.functionToCall()
    //Func_ViewController.goNext()
        //Func_ViewController().goNext()
            print("Success")
            self.performSegue(withIdentifier: a, sender: self)
    
    
        })
    }
    
    
    func SetBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"Background")!)
        print("sssss")
        
    }
    
    public var APIkey = "AIzaSyDrpBGicJ_0cqN4LeKIuhTYox7fuiVZVhc"
    
    
    
//    //----------------------------ActivityIndicator Start---------------------------
//    let alert1 = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//    
//    
//    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//    loadingIndicator.hidesWhenStopped = true
//    loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
//    loadingIndicator.startAnimating();
//    
//    alert1.view.addSubview(loadingIndicator)
//    self.present(alert1, animated: true, completion: nil)
//    loadingIndicator.startAnimating()
//    //self.dismiss(animated: false, completion: nil)
//    //----------------------------END ActivityIndicator Start---------------------------
    
    
       
        
        
    
        
    
    

}
