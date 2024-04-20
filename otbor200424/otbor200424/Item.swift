//
//  Item.swift
//  otbor200424
//
//  Created by Dariya on 20/4/24.
//

import Foundation

struct ItemPerson: Codable {
    let id: Int
    let image: String
    let name: String
}
 
struct Item: Codable {
    let allItem: [ItemPerson]
}
