//
//  PhotoViewModel.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 7/2/22.
//

import Foundation

class PhotoViewModel
{
    var refreshDataSource = { () -> () in }
    
    var dataSource: [PhotoModel] = []
    {
        didSet
        {
            refreshDataSource()
        }
    }
    
    func  getPhotos(postId: Int)
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/photos") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonRes = data else { return }
            do
            {
                sleep(1)
                let decoder = JSONDecoder()
                self.dataSource = try decoder.decode([PhotoModel].self, from: jsonRes)
            }
            catch let error
            {
                print("Something went wrong: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
