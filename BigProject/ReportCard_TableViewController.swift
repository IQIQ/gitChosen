//
//  ReportCard_TableViewController.swift
//  BigProject
//
//  Created by Thiprat on 2/6/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

protocol ContentDelegate {
    func updateContent(id: Int)
}

class ReportCard_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test loadTableView")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Refresh WillAppear tableView")

        self.tableView.reloadData()
        
    }
    

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(StructOperation.atas.data_Card_ID == []){
            return 0
        }
        return StructOperation.atas.getData_Transaction_id.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myOtherCell:CellReportCard_TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CellReportCard_TableViewCell)!
        
        
        if(StructOperation.atas.data_Card_ID == []){
            myOtherCell.TextID.text = "00"
            myOtherCell.TextCardID.text = "0F0D00E00"
            myOtherCell.TextStationID.text = "EVB-P0000000"
            myOtherCell.TextTimeStamp.text = "00-00-2018 16:00"
            myOtherCell.TextMetereindDate.text = "00-00-2018 16:00"
            myOtherCell.TextTotal.text = "0.0:0"
            myOtherCell.TextTotalCharge.text = "00:00:00 Minute"
            myOtherCell.TextPerMin.text = "0.00 Bath"
            print("StructOperation.atas.data_Card_ID == []")
        }else{
            myOtherCell.TextID.text = StructOperation.atas.getData_Transaction_id[indexPath.row]
            myOtherCell.TextCardID.text = StructOperation.atas.getData_Card_ID[indexPath.row]
            myOtherCell.TextStationID.text = StructOperation.atas.getData_Pole_ID[indexPath.row]
            myOtherCell.TextTimeStamp.text = StructOperation.atas.getData_Meterstartdate[indexPath.row]
            myOtherCell.TextMetereindDate.text = StructOperation.atas.getData_Metereinddate[indexPath.row]
            myOtherCell.TextTotal.text = StructOperation.atas.getData_Price[indexPath.row]
            myOtherCell.TextTotalCharge.text = StructOperation.atas.getData_Total[indexPath.row]
            myOtherCell.TextPerMin.text = StructOperation.atas.getData_Totalprice[indexPath.row]
            print("HaveData")
            
        }

        
        return myOtherCell
        
    }
    
    
    
    //-------------------------Func Refresh----------------
    func refresh(){
        
        self.tableView.reloadData()
        //self.view.layoutIfNeeded()
        ReportCard_TableViewController().tableView.reloadData()
        print("Use func Reload")
        
    }
    //-------------------------Func Refresh----------------
    

   
}
