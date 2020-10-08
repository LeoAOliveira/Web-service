//
//  MainTableViewCell.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var subcomponents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
