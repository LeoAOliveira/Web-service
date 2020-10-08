//
//  SearchItemViewController.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class SearchItemViewController: UIViewController {

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subcomponentsLabel: UILabel!
    @IBOutlet weak var responseStackView: UIStackView!
    
    var part: Part?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        responseStackView.isHidden = true
    }
    
    @IBAction func searchbuttonPressed(_ sender: Any) {
        
        if codeTextField.hasText {
            Request.getPart(code: codeTextField.text ?? "") { (response) in
                self.part = response
                self.updateUI()
            }
        }
    }
    
    func updateUI() {
        nameLabel.text = part?.name
        descriptionLabel.text = part?.description
        
        if let components = part?.subcomponents {
            
            var componentText: String = ""
            
            for i in 0..<components.count {
                if i == components.count-1 {
                    componentText = "\(componentText) \(components[i].part.name)."
                } else {
                    componentText = "\(componentText) \(components[i].part.name),"
                }
            }
            subcomponentsLabel.text = componentText
        } else {
            subcomponentsLabel.text = "Não há subcomponentes"
        }
        
        responseStackView.isHidden = false
    }
    
}
