//
//  CustomTableViewCell.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //public weak var ctvcDelegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblBody: UILabel!
    
    @IBOutlet weak var btnGoToPhotos: UIButton!
    
    @IBOutlet weak var btnGoToComments: UIButton!
    
    /*@IBAction func btnGoToPhotos(_ sender: AnyObject) {
        print("btnGoToPhotos");
        if let tag = sender.view?.tag {
            print("btnGoToPhotos 2");
            self.ctvcDelegate?.btnGoToPhotosTapped(sender: sender as! UITapGestureRecognizer, index: tag)
        }
    }
    
    @IBAction func btnGoToComments(_ sender: AnyObject) {
        print("btnGoToComments");
        if let tag = sender.view?.tag {
            print("btnGoToComments 2");
            self.ctvcDelegate?.btnGoToCommentsTapped(sender: sender as! UITapGestureRecognizer, index: tag)
        }
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
