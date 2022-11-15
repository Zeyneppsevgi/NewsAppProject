//
//  NewsCellTableViewCell.swift
//  NewProject
//
//  Created by Zeynep Sevgi on 13.11.2022.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
