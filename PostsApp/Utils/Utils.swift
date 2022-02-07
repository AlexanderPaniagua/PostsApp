//
//  Utils.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 7/2/22.
//

import Foundation
import UIKit

public class Utils
{
    
    static func getImageFromUrl(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
