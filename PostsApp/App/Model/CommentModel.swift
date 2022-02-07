//
//  CommentModel.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation

class CommentModel : Codable
{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
