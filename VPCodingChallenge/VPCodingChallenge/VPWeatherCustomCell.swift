//
//  VPWeatherCustomCellTableViewCell.swift
//  VPCodingChallenge
//
//  Created by intelliswift on 11/4/16.
//  Copyright © 2016 Krishna. All rights reserved.
//

// =================================================================================================
// Imports
// =================================================================================================

import UIKit

class VPWeatherCustomCell: UITableViewCell {
    @IBOutlet weak var tempratureInfoLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityInfoLabel: UILabel!

    @IBOutlet weak var coordinateInfoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
