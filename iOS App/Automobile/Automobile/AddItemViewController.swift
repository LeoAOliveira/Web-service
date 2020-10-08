//
//  AddItemViewController.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var list: [Part] = []
    var selected: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if nameTextField.hasText && descriptionTextField.hasText {
            
            var subcomponents: [Subcomponent] = []
            
            for i in 0..<list.count {
                if let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? SubcomponentsTableViewCell,
                   cell.amountStepper.value > 0 {
                    let subcomponent = Subcomponent(amount: Int(cell.amountStepper.value), 
                                                    part: cell.part ?? Part(code: "", name: "", description: "", subcomponents: []))
                    subcomponents.append(subcomponent)
                }
                
            }
            
            let part = Part(code: "", 
                            name: nameTextField.text ?? "Carro", 
                            description: descriptionTextField.text ?? "Esportivo", 
                            subcomponents: subcomponents)
            
            Request.addPart(part: part) { (status) in
                
                DispatchQueue.main.async {
                    if status == "Success" {
                        self.createAlert(title: "\(part.name) salvo", message: "Salvamento com sucesso", actionTitle: "Ok")
                    } else {
                        self.createAlert(title: "Erro", message: "\(part.name) falhou. Tente novamente", actionTitle: "Ok")
                    }
                }
            }
        }
    }
    
    func createAlert(title: String, message: String, actionTitle: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let fillLabelAction = UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in 
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(fillLabelAction)
        self.present(alert, animated: true, completion: nil)
    }
        
    
}

extension AddItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? SubcomponentsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = list[indexPath.row].name
        cell.part = list[indexPath.row]
        
        return cell
    }
    
}
