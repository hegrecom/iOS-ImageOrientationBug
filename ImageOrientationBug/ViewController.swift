//
//  ViewController.swift
//  ImageOrientationBug
//
//  Created by TKang on 2017. 11. 4..
//  Copyright © 2017년 TKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var images = [#imageLiteral(resourceName: "Landscape_1"), #imageLiteral(resourceName: "Landscape_2"), #imageLiteral(resourceName: "Landscape_3"), #imageLiteral(resourceName: "Landscape_4"), #imageLiteral(resourceName: "Landscape_5"), #imageLiteral(resourceName: "Landscape_6"), #imageLiteral(resourceName: "Landscape_7"), #imageLiteral(resourceName: "Landscape_8")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<images.count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            self.view.addSubview(imageView)
            imageViews.append(imageView)
        }
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        imageViews[0].frame = CGRect(x: 0, y: 0, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[1].frame = CGRect(x: screenWidth/2, y: 0, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[2].frame = CGRect(x: 0, y: screenHeight/4, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[3].frame = CGRect(x: screenWidth/2, y: screenHeight/4, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[4].frame = CGRect(x: 0, y: screenHeight/4*2, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[5].frame = CGRect(x: screenWidth/2, y: screenHeight/4*2, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[6].frame = CGRect(x: 0, y: screenHeight/4*3, width: screenWidth/2.0, height: screenHeight/4.0)
        imageViews[7].frame = CGRect(x: screenWidth/2, y: screenHeight/4*3, width: screenWidth/2.0, height: screenHeight/4.0)
        
        redrawImages(with: images)
    }
    
    func redrawImages(with images: [UIImage]) {
        for i in 0..<images.count {
            UIGraphicsBeginImageContext(images[i].size)
            images[i].draw(in: CGRect(x: 0, y: 0, width: images[i].size.width, height: images[i].size.height))
            let image = UIGraphicsGetImageFromCurrentImageContext()!
            print("original image orientation \(images[i].imageOrientation.rawValue)  drawn image orientation \(image.imageOrientation.rawValue)")
            UIGraphicsEndImageContext()
            imageViews[i].image = image
        }
    }
}


