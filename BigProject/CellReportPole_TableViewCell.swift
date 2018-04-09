//
//  CellReportPole_TableViewCell.swift
//  BigProject
//
//  Created by Thiprat on 4/2/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class CellReportPole_TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    @IBOutlet weak var TextID: UILabel!
    @IBOutlet weak var TextCardID: UILabel!
    
    @IBOutlet weak var TextStationID: UILabel!
    
    @IBOutlet weak var TextTimeStamp: UILabel!
    
    @IBOutlet weak var TextMetereindDate: UILabel!
    
    @IBOutlet weak var TextTotal: UILabel!
    
    @IBOutlet weak var TextTotalCharge: UILabel!
    
    @IBOutlet weak var TextPerMin: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
