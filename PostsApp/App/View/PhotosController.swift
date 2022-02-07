//
//  PhotosController.swift
//  PostsApp
//
//  Created by Alexander Paniagua on 6/2/22.
//

import Foundation
import UIKit

class PhotosController : UIViewController
{
    //MARK: Class properties
    public var postId: Int = 0
    public var postTitle: String = ""
    private var photoViewModel = PhotoViewModel()
    
    //MARK: UI properties
    private var scrollView: UIScrollView = UIScrollView()
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parent?.title = "Photos"
        self.buildView()
    }
    
    
    //MARK: ScrollView builder
    private func buildScrollView()
    {
        //ScrollView and its contraints
        self.scrollView = UIScrollView(
            frame:
                CGRect(
                    x: self.view.widthUnits(units: 2),
                    y: self.view.heightUnits(units: 5),
                    width: self.view.widthUnits(units: 96),
                    height: self.view.heightUnits(units: 80))
        )
        
        self.scrollView.setBorder(borderWidth: 0.5, color: .darkGray)
        
        //Add the ScrollView to the inherited view
        self.view.addSubview(scrollView)
    }
    
    //MARK: ImageView builder
    private func buildImageView(photos: [PhotoModel])
    {
        scrollView.removeSubViews()
        
        let alto = self.view.heightUnits(units: 35)
        let ancho = self.view.widthUnits(units: 35)
        let margen = self.lblTitle.widthUnits(units: 2)
        let margeY = self.lblTitle.heightUnits(units: 2)
        let cantidadControles = 2
        var newX:CGFloat = 0
        var y:CGFloat = margeY
        var index:CGFloat = 0
        
        for (i,item) in photos.enumerated() {
            if( Int(index + 1) > cantidadControles) {
                index = 0
                y = y + (alto + margeY)
            }
            
            if( index == 0){
                newX = margen + (index * ancho)
            }else{
                newX = newX + ancho + (margen * 2)
            }
            
            let imageView = UIImageView()
            
            if let validUrl = URL(string: item.url)
            {
                Utils.getImageFromUrl(from: validUrl) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async() { [weak self] in
                        imageView.image = UIImage(data: data)
                    }
                }
            }
            
            imageView.frame = CGRect(x: newX,
                                     y: y,
                                     width: ancho,
                                     height: alto)
            imageView.contentMode = .scaleAspectFit
            imageView.tag = i
            
            scrollView.addSubview(imageView)
            index += 1
        }
        let altoTotal = CGFloat( y + alto)
        scrollView.contentSize = CGSize(width: scrollView.frame.width,
                                        height: altoTotal)
    }
    
    //MARK: Data binder
    private func bindData()
    {
        self.photoViewModel.refreshDataSource = { [weak self] () in
            DispatchQueue.main.async {
                //self?.activityIndicator.stopAnimating()
                //self?.activityIndicator.isHidden = true
                if let ds = self?.photoViewModel.dataSource {
                    self?.buildImageView(photos: ds)
                }
            }
        }
    }
    
    //MARK: View builder
    private func buildView()
    {
        self.lblTitle.text = self.postTitle
        self.buildScrollView()
        self.photoViewModel.getPhotos(postId: self.postId)
        self.bindData()
    }
    
}
