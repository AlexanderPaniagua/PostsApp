//
//  UIView.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 7/2/22.
//

import Foundation
import UIKit

extension UIView
{
    public func widthUnits(units:CGFloat = 1) -> CGFloat {
        return self.frame.width / 100 * units
    }

    public func heightUnits(units:CGFloat = 1) -> CGFloat {
        return self.frame.height / 100 * units
    }
    
    public func setBorder(borderWidth:CGFloat, color:UIColor){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
    
    public func removeSubViews(){
        let theSubviews: Array = (self.subviews)
        for view in theSubviews {
            view.removeFromSuperview()
        }
    }
    
}
