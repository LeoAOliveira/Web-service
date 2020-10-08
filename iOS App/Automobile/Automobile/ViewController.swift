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
    }


}

