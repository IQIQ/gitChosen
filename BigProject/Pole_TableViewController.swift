//
//  Pole_TableViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/30/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class Pole_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StructOperation.atas.data_Pole_ID.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myOtherCell:CellPoleTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CellPoleTableViewCell)!
        
        let row = indexPath.row + 1
        //let x: Int? = Int(myString)
        let StringRow: String = String(row)
        
        print(StringRow)

        if indexPath.row % 2 == 0 {
            // Even
            myOtherCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            myOtherCell.LabelNo.text = StringRow
            myOtherCell.LabelStation.text = StructOperation.atas.data_Pole_ID[indexPath.row]
            
            
            
        } else {
            // Odd
            myOtherCell.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.9568627451, blue: 0.8784313725, alpha: 1) //#daf4e0
            myOtherCell.LabelNo.text = StringRow
            myOtherCell.LabelStation.text = StructOperation.atas.data_Pole_ID[indexPath.row]
        }
        
        
        return myOtherCell
        
    }

   
    
    
    
    
    
    
}
