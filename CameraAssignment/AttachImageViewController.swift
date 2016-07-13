//
//  ViewController.swift
//  CameraAssignment
//
//  Created by Ryan Cortez on 7/13/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import UIKit

class AttachImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.borderWidth = 4.0
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10.0
    }

    @IBAction func imageViewPressed(sender: AnyObject) {
        let imagePickerView = UIImagePickerController()
        self.presentViewController(imagePickerView, animated: true, completion: nil)
    }

}

