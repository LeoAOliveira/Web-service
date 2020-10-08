//
//  Part.swift
//  Automobile
//
//  Created by Leonardo Oliveira on 08/10/20.
//

import Foundation

struct Part: Codable {
    var code: String
    var name: String
    var description: String
    var subcomponents: [Subcomponent]
}
