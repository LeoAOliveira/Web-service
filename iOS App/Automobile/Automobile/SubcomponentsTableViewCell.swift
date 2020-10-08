//
//  SubcomponentsTableViewCell.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class SubcomponentsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountStepper: UIStepper!
    @IBOutlet weak var amountLabel: UILabel!
    
    var part: Part?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        amountLabel.text = "\(amountStepper.value)"
    }
    

}
