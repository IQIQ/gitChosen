//
//  Report_CardViewController.swift
//  BigProject
//
//  Created by Thiprat on 4/2/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON
import Foundation
extension UIViewController{
    func reloadViewFromNib(){
        let parent = view.superview
        view = nil
        parent?.addSubview(view)
        print("r")
    }
}

class Report_CardViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    @IBOutlet var containerView: UIView!
    
    //-------------------------------------lable&textField----------------------------------
    
    @IBOutlet weak var LeadingConstaraint: NSLayoutConstraint!
    var MenuShowing = false
    
    @IBOutlet weak var MenuView: UIView!
    
    
    
    //-------------------------------------Endlable&textField----------------------------------
    

    
    @IBOutlet weak var TextCard: UITextField!
    @IBOutlet weak var TextTo: UITextField!
    @IBOutlet weak var TextFrom: UITextField!
    var datePickerView:UIPickerView = UIPickerView()
    
    //var arkeyboardType = ["All Card","4F6D51D6","8804222C"]
    var dataIDCard = ["All Card"] + StructOperation.atas.data_Card_ID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad Main")
        ReportCard_TableViewController().viewWillAppear(true)
        
        
        
        
        
    }
    
//----------------------------------SELECT START DATE--------------------------------------------
    @IBAction func SelectFrom(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        
        sender.inputView = datePickerView
        
        
        datePickerView.addTarget(self, action: #selector(Report_CardViewController.datePickerValueChangedTextFrom(sender:)), for: UIControlEvents.valueChanged)
        
        //-------- none button picker---------
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Report_CardViewController.donePickerFrom))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        TextFrom.inputView = datePickerView
        TextFrom.inputAccessoryView = toolBar
        
    }
    
    //--------------------------------SELECT END DATE---------------------------------------------
    @IBAction func SelectTo(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        
        sender.inputView = datePickerView
        
        
        datePickerView.addTarget(self, action: #selector(Report_CardViewController.datePickerValueChangedTextTo(sender:)), for: UIControlEvents.valueChanged)
        
        //-------- none button picker---------
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Report_CardViewController.donePickerTo))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        TextTo.inputView = datePickerView
        TextTo.inputAccessoryView = toolBar
        
    }
    
    
    //-------------------------------------SELECT CARD---------------------------------------------------
    @IBAction func SelectCard(_ sender: UITextField) {
        datePickerView.dataSource = self
        datePickerView.delegate = self
        sender.inputView = datePickerView
        
        //--------none button picker---------
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Report_CardViewController.donePickerCard))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        TextCard.inputView = datePickerView
        TextCard.inputAccessoryView = toolBar
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataIDCard.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataIDCard[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        TextCard.text = dataIDCard[row]
    }
    

    
    @objc func donePickerCard() {
        TextCard.resignFirstResponder()
    }
    @objc func donePickerFrom() {
        TextFrom.resignFirstResponder()
    }
    @objc func donePickerTo() {
        TextTo.resignFirstResponder()
    }
    
    
    
    
    @objc func datePickerValueChangedTextFrom(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none //MediumStyle
        dateFormatter.dateStyle = DateFormatter.Style.short //NoStyle
        //dateFormatter.timeStyle = NSDateFormatterStyle.24
        //dateFormatter.setIs24HourView(true);
        dateFormatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale!
        dateFormatter.dateFormat = "yyyy/MM/dd"
        TextFrom.text = dateFormatter.string(from: sender.date)
        
    }
    
    @objc func datePickerValueChangedTextTo(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none //MediumStyle
        dateFormatter.dateStyle = DateFormatter.Style.short //NoStyle
        //dateFormatter.timeStyle = NSDateFormatterStyle.24
        //dateFormatter.setIs24HourView(true);
        dateFormatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale!
        dateFormatter.dateFormat = "yyyy/MM/dd"
        TextTo.text = dateFormatter.string(from: sender.date)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func ClearButton(_ sender: UIButton) {
        self.TextCard.text = "----Select Card----"
        self.TextFrom.text = "Start Date"
        self.TextTo.text = "End Date"
        
        resetData()

        self.reloadViewFromNib()
        
        
    }
    

    
    @IBAction func SearchButton(_ sender: UIButton) {

        
        resetData()
        
        
        var parameters: Parameters
        if  (TextCard.text! == "All Card")
        {
            parameters = ["user_id": StructOperation.atas.UserID,"types": "Card","pole_or_card_id": "","fromdate": TextFrom.text!,"enddate": TextTo.text!]
        }
        else if (TextFrom.text! == "Start Date")
        {
            parameters = ["user_id": StructOperation.atas.UserID,"types": "Card","pole_or_card_id": "","fromdate": "","enddate": TextTo.text!]
        }
        else if (TextTo.text! == "End Date")
        {
            parameters = ["user_id": StructOperation.atas.UserID,"types": "Card","pole_or_card_id": "","fromdate": TextFrom.text!,"enddate": ""]
        }
        else if (TextFrom.text! == "Start Date" && TextTo.text! == "End Date")
        {
            parameters = ["user_id": StructOperation.atas.UserID,"types": "Card","pole_or_card_id": "","fromdate": "","enddate": ""]
        }
        else{
            parameters = ["user_id": StructOperation.atas.UserID,"types": "Card","pole_or_card_id": TextCard.text!,"fromdate": TextFrom.text!,"enddate": TextTo.text!]
        }
        
        if (TextCard.text != "----Select Card----"){
            
            //----------------------------ActivityIndicator Start---------------------------
            //var alert1 = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            StructOperation.atas.alert.view.addSubview(loadingIndicator)
            self.present(StructOperation.atas.alert, animated: true, completion: nil)
            loadingIndicator.startAnimating()
            //self.dismiss(animated: false, completion: nil)
            //----------------------------END ActivityIndicator---------------------------
            

        Alamofire.request("http://app.chosenenergy.co.th/Report/report",method: .post, parameters: parameters).validate().responseString{(responseData) -> Void in
            //print(responseData)
            
            //----------------------------ActivityIndicator Start---------------------------
            StructOperation.atas.alert.message = "Cannot Connect Sever"
            StructOperation.atas.alert.dismiss(animated: false, completion: nil)
            //----------------------------END ActivityIndicator Start---------------------------
            
            
            if((responseData.result.value) != nil) {
                //                let swiftyJsonVar = JSON(responseData.result.value!)
                let stringJson = String(describing: responseData.result.value!)
                print("s")
                print(stringJson)

                
                
                
                
      //--------------------------------------- Fix API ----------------------------------
                
                var ConvertString = stringJson.replacingOccurrences(of: "[\\']", with: "\"", options: .regularExpression, range: nil)
                //print(ConvertString)
                
                if ConvertString.range(of:"ComboChart]") != nil {
                //y.insert("\"", at: y.range(of: "PieChart"))
                let range: Range<String.Index> = ConvertString.range(of: "ComboChart]")!
                let StartindexCombo: Int = ConvertString.distance(from: ConvertString.startIndex, to: range.lowerBound)
                ConvertString.remove(at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexCombo+10))

//                if ConvertString.range(of:"PieChart") != nil {
//                    //y.insert("\"", at: y.range(of: "PieChart"))
//                    let rangePie: Range<String.Index> = ConvertString.range(of: "PieChart")!
//                    let StartindexPie: Int = ConvertString.distance(from: ConvertString.startIndex, to: rangePie.lowerBound)
//                    let rangeCom: Range<String.Index> = ConvertString.range(of: "ComboChart")!
//                    let StartindexCom: Int = ConvertString.distance(from: ConvertString.startIndex, to: rangeCom.lowerBound)
//                    print(StartindexPie)
//                    print(StartindexCom)
                
                    
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: 1))
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: 10))
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexPie+2))
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexPie+11))
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexCom+4))
//                    ConvertString.insert("\"", at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexCom+15))
//                    if ConvertString.range(of:"ComboChart]\":]") != nil{
//                        ConvertString.insert("[", at: ConvertString.index(ConvertString.startIndex, offsetBy: StartindexCom+18))
//
//
//                    }
                    
                    print("==================================================")
                    print("After add ConvertString: \(ConvertString)")


                    print("exists")
                    print("==================================================")
//                }
                
//---------------------------------------- Fix API --------------------------------
     
    }
                
      
                    do {
                        
                        //let data : NSData = NSData() // change your data variable as you get from webservice response
                        let data: NSData = ConvertString.data(using: String.Encoding.utf8)! as NSData
                        guard let teamJSON =  try JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any],
                            let dataTable = teamJSON["Datagrid"] as? [[String:Any]]
                            else { return }
                        
                            let dataPiechart = teamJSON["PieChart"] as? [[String:Any]]
                        
                            let dataBarchart = teamJSON["ComboChart"] as? [[String:Any]]

                        
                        //looping through all the json objects in the array teams
                        for i in 0 ..< dataTable.count{

                            let transaction_id = String(dataTable[i]["transaction_id"] as! NSInteger)
                            let card_id: String = ((dataTable[i]["card_id"] as! NSString) as String)
                            let pole_id: String = ((dataTable[i]["pole_id"] as! NSString) as String)
                            let meterstartdate: String = ((dataTable[i]["meterstartdate"] as! NSString) as String)
                            let metereinddate: String = ((dataTable[i]["metereinddate"] as! NSString) as String)
                            let price: String = ((dataTable[i]["price"] as! NSString) as String)
                            let total: String = ((dataTable[i]["Total"] as! NSString) as String)
                            let totalprice: String = ((dataTable[i]["totalprice"] as! NSString) as String)
                            StructOperation.atas.getData_Transaction_id += [transaction_id]
                            StructOperation.atas.getData_Card_ID += [card_id]
                            StructOperation.atas.getData_Pole_ID += [pole_id]
                            StructOperation.atas.getData_Meterstartdate += [meterstartdate]
                            StructOperation.atas.getData_Metereinddate += [metereinddate]
                            StructOperation.atas.getData_Price += [price]
                            StructOperation.atas.getData_Total += [total]
                            StructOperation.atas.getData_Totalprice += [totalprice]
                            
                        }
                        for j in 0 ..< dataPiechart!.count{
                            let Piecard_id: String = ((dataPiechart![j]["card_id"] as! NSString) as String)
                            let total = Double(dataPiechart![j]["Total"] as! NSInteger)
                            StructOperation.atas.idPieChart += [Piecard_id]
                            StructOperation.atas.DataDoublePieChart += [total]
                            print(StructOperation.atas.idPieChart)
                            print(StructOperation.atas.DataDoublePieChart)
                        }
                        for k in 0 ..< dataBarchart!.count{
                            let Barcard_id: String = ((dataBarchart![k]["CARD_ID"] as! NSString) as String)
                            let value = Array(dataBarchart![k]["VALUE"] as! NSArray)
                            StructOperation.atas.idBarChart += [Barcard_id]
                            StructOperation.atas.DataDoubleBarChart += [value]
                            print(StructOperation.atas.idBarChart)
                            print(StructOperation.atas.DataDoubleBarChart)
 
                        }
                        
                        print("Get Data is OK...")
                    } catch {
                        print(error)
                    }

                
              self.reloadViewFromNib()
            }
            }
            //----------------------------ActivityIndicator Start---------------------------
                StructOperation.atas.alert.message = "Please wait..."
                StructOperation.atas.alert.dismiss(animated: false, completion: nil)
            //----------------------------END ActivityIndicator---------------------------
            
                }else{
                    let alert = UIAlertController(title: "Alert", message: "Please Select CardID", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
    
                    print("Select CardID")
                    //self.activityLoader.stopAnimating()
                }
        
    
    }

    
    //---------------------------------------MenuBar--------------------------------------
    
    
    @IBAction func MenuButton(_ sender: Any) {
        
        
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
    
    //---------------------------------------MenuBar--------------------------------------
    
    func resetData(){
        StructOperation.atas.getData_Transaction_id = []
        StructOperation.atas.getData_Card_ID = []
        StructOperation.atas.getData_Pole_ID = []
        StructOperation.atas.getData_Meterstartdate = []
        StructOperation.atas.getData_Metereinddate = []
        StructOperation.atas.getData_Price = []
        StructOperation.atas.getData_Total = []
        StructOperation.atas.getData_Totalprice = []
        
        StructOperation.atas.idPieChart = []
        StructOperation.atas.DataDoublePieChart = []
        
        StructOperation.atas.idBarChart = []
        StructOperation.atas.DataDoubleBarChart = []
        
    }

    @IBAction func b_Home(_ sender: Any) {
        resetData()
    }
    @IBAction func b_Card(_ sender: Any) {
        resetData()
    }
    @IBAction func b_Pole(_ sender: Any) {
        resetData()
    }
    @IBAction func b_Reportpole(_ sender: Any) {
        resetData()
    }
 
    
}
