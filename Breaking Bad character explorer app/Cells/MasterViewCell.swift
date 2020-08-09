//
//  MasterViewCell.swift
//  Breaking Bad character explorer app
//
//  Created by Emil Vaklinov on 01/08/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import UIKit

class MasterViewCell: UITableViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
