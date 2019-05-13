//
//  SchoolTableViewCell.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 5/13/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
let cellIdentifier = "SchoolTableViewCell"
    @IBOutlet weak var lblSchoolName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
