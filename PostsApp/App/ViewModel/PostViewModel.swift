//
//  PostViewModel.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation

class PostViewModel
{
    var refreshDataSource = { () -> () in }
    
    var dataSource: [PostModel] = []
    {
        didSet
        {
            refreshDataSource()
        }
    }
    
    func  getPosts()
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonRes = data else { return }
            do
            {
                sleep(1)
                let decoder = JSONDecoder()
                self.dataSource = try decoder.decode([PostModel].self, from: jsonRes)
            }
            catch let error
            {
                print("Something went wrong: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
