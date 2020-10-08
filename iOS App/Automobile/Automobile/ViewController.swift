//
//  ViewController.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Request.getList { (partRepository) in
            print(partRepository)
        }
        
        print("\n\n\n")
        
        let part = Part(code: "", name: "Ferrari", description: "Esportivo", subcomponents: [])
        Request.addPart(part: part) { (status) in
            print(status)
        }
        
        print("\n\n\n")
        
        Request.getPart(code: "c06f9f38-bcbf-4696-9078-0a20e0f71a3f") { (part) in
            print(part)
        }
    }

}

