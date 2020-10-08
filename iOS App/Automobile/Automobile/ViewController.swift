//
//  ViewController.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Request.getList { (partRepository) in
            self.list = partRepository.parts
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        cell.name.text = list[indexPath.row].name
        cell.itemDescription.text = list[indexPath.row].description
        
        let components = list[indexPath.row].subcomponents
        
        if components.count > 0 {
            
            var componentText: String = ""
            
            for i in 0..<components.count {
                if i == components.count-1 {
                    componentText = "\(componentText) \(components[i].part.name)."
                } else {
                    componentText = "\(componentText) \(components[i].part.name),"
                }
            }
            cell.subcomponents.text = componentText
        } else {
            cell.subcomponents.text = "Não há subcomponentes"
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            if let destination = segue.destination as? AddItemViewController {
                destination.list = self.list
            }
        }
    }
    
    
}

