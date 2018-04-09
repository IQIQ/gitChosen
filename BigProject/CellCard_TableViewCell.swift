//
//  CellCard_TableViewCell.swift
//  BigProject
//
//  Created by Thiprat on 1/29/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class CellCard_TableViewCell: UITableViewCell {

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
