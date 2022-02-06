//
//  PhotoModel.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation

class PhotoModel : Codable
{
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
