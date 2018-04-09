//
//  CellPoleTableViewCell.swift
//  BigProject
//
//  Created by Thiprat on 1/30/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class CellPoleTableViewCell: UITableViewCell {


    @IBOutlet weak var LabelNo: UILabel!
    @IBOutlet weak var LabelStation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
