//
//  UserDataModel.swift
//  Demo
//
//  Created by Macbook Air on 07/04/21.
//  Copyright © 2021 Dinesh. All rights reserved.
//

import Foundation

struct UserDataModel : Codable {

        let status : Bool?
        let statusMessage : String?
        let userList : [UserList]?

        enum CodingKeys: String, CodingKey {
                case status = "status"
                case statusMessage = "statusMessage"
                case userList = "userList"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                status = try values.decodeIfPresent(Bool.self, forKey: .status)
                statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
                userList = try values.decodeIfPresent([UserList].self, forKey: .userList)
        }

}

struct UserList : Codable {

        let emailId : String?
        let firstName : String?
        let hobbies : [String]?
        let imageUrl : String?
        let lastName : String?

        enum CodingKeys: String, CodingKey {
                case emailId = "emailId"
                case firstName = "firstName"
                case hobbies = "hobbies"
                case imageUrl = "imageUrl"
                case lastName = "lastName"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                emailId = try values.decodeIfPresent(String.self, forKey: .emailId)
                firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
                hobbies = try values.decodeIfPresent([String].self, forKey: .hobbies)
                imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
                lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        }

}
