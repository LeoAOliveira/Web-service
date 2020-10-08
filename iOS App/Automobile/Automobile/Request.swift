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
    
    static func getPart(code: String, completionHandler: @escaping (_ part: Part) -> Void) {
        
        guard let requestURL = URL(string: "http://127.0.0.1:8000/getPart/\(code)") else { 
            return
        }
        
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if error != nil { 
                return 
            }
            
            if let data = data {
                do {
                    let part = try JSONDecoder().decode(Part.self, from: data)
                    
                    DispatchQueue.main.async {
                        completionHandler(part)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    static func addPart(part: Part, completionHandler: @escaping (_ response: String) -> Void) {
        
        guard let requestURL = URL(string: "http://127.0.0.1:8000/addPart") else { 
            return
        }
        
        let session = URLSession.shared
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            request.httpBody = try encoder.encode(part)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                completionHandler("Failure")
                return
            }
            
            completionHandler("Success")
        })
        task.resume()
        
    }
    
}
