//
//  MyCardCell_TableViewCell.swift
//  BigProject
//
//  Created by Atas Thiprat on 1/29/18.
//  Copyright © 2018 Atas Thiprat. All rights reserved.
//

import UIKit

class MyCardCell_TableViewCell: UITableViewCell {

    @IBOutlet weak var LableNo: UILabel!
    @IBOutlet weak var LableStationNo: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
