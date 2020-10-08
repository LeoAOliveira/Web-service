//
//  Request.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import Foundation

final class Request {
    
    static func getList(completionHandler: @escaping (_ partRepository: PartRepository) -> Void) {
        
        guard let requestURL = URL(string: "http://127.0.0.1:8000/getList") else { 
            return
        }
        
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if error != nil { 
                return 
            }
            
            if let data = data {
                do {
                    let partRepository = try JSONDecoder().decode(PartRepository.self, from: data)
                    
                    DispatchQueue.main.async {
                        completionHandler(partRepository)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}
