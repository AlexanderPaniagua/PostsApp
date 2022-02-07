//
//  PostModel.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation

class PostModel : Codable
{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
