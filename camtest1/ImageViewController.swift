//
//  ImageViewController.swift
//  camtest1
//
//  Created by matt on 1/8/17.
//  Copyright © 2017 BoulevardLabs. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var image: UIImage?
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let validImage = self.image {
            self.imageView.image = validImage
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
