//
//  ViewController.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = PostViewModel()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildView()
    }

    private func buildView()
    {
        self.activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let textFieldCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tblView.register(textFieldCell, forCellReuseIdentifier: "CustomTableViewCell")
        
        self.viewModel.getPosts()
        self.bindData()
    }
    
    private func bindData()
    {
        self.viewModel.refreshDataSource = { [weak self] () in
            DispatchQueue.main.async {
                self?.tblView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
    
    private func navigateToPhotos(postId: Int, title: String)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PhotosController") as! PhotosController
        vc.postId = postId
        vc.postTitle = title
        self.present(vc, animated: true, completion: nil)
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource/*, CustomTableViewCellDelegate*/
{
    
    @objc func btnGoToPhotosClicked(_ sender:AnyObject) {
        if let tag = sender.view?.tag {
            print("btnGoToPhotosClicked.tag: \(tag)")
            let postId = self.viewModel.dataSource[tag].id
            let title = self.viewModel.dataSource[tag].title
            self.navigateToPhotos(postId: postId, title: title)
        }
        else
        {
            print("Invalid sender.")
        }
    }
    
    @objc func btnGoToCommentsClicked(_ sender:AnyObject) {
        if let tag = sender.view?.tag {
            print("btnGoToPhotosClicked.tag: \(tag)")
        }
        else
        {
            print("Invalid sender.")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            
            let object = self.viewModel.dataSource[indexPath.row]
            let btnPhotosTapEvent = UITapGestureRecognizer(target: self, action: #selector(self.btnGoToPhotosClicked(_:)))
            let btnCommentsTapEvent = UITapGestureRecognizer(target: self, action: #selector(self.btnGoToCommentsClicked(_:)))
            
            cell.lblTitle?.text = object.title
            cell.lblBody?.text = object.body
            
            cell.btnGoToPhotos.tag = indexPath.row
            cell.btnGoToComments.tag = indexPath.row
            
            cell.btnGoToPhotos.addGestureRecognizer(btnPhotosTapEvent)
            cell.btnGoToComments.addGestureRecognizer(btnCommentsTapEvent)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
    
    
}
