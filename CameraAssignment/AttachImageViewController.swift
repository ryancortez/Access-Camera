//
//  ViewController.swift
//  CameraAssignment
//
//  Created by Ryan Cortez on 7/13/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import UIKit

class AttachImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.borderWidth = 4.0
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10.0
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.image = originalImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func imageViewPressed(sender: AnyObject) {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        self.presentViewController(imagePickerView, animated: true, completion: nil)
    }

}

