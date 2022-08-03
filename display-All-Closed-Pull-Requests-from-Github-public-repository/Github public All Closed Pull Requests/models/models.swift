//
//  models.swift
//  Github public All Closed Pull Requests
//
//  Created by Admin on 03/08/22.
//

import Foundation

struct owners : Decodable{
    let login: String?
    let avatar_url: String?
}

struct gitRepositoryData: Decodable {
    let id: Int
    let name: String
    let full_name: String
    let created_at: String?
    let updated_at: String?
    let owner: owners
}
