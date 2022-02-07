//
//  CustomTableViewCellDelegate.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation
import UIKit

public protocol CustomTableViewCellDelegate : class
{
    func btnGoToPhotosTapped(sender: UITapGestureRecognizer, index:Int)
    func btnGoToCommentsTapped(/*sender: UITapGestureRecognizer,*/ index:Int)
}

/*public extension CustomTableViewCellDelegate
{
    func btnGoToPhotosTapped(sender: UITapGestureRecognizer, index:Int) {}
    func btnGoToCommentsTapped(sender: UITapGestureRecognizer, index:Int) {}
}*/
