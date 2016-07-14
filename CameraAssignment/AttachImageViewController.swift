//
//  ViewController.swift
//  CameraAssignment
//
//  Created by Ryan Cortez on 7/13/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import UIKit

class AttachImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate{

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
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self

        
        let alertController = UIAlertController(title: "Attach a photo", message: nil, preferredStyle: .ActionSheet)
        
        // Actions for the UIAlertController
        let pickFromPhotoLibrary = UIAlertAction(title: "Add from Photo Library", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
        }
        let takeFromCamera = UIAlertAction(title: "Take a photo", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .Camera
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (alert :UIAlertAction) in
            
        }

        alertController.addAction(takeFromCamera)
        alertController.addAction(pickFromPhotoLibrary)
        alertController.addAction(cancel)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveToCameraButtonPressed(sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil);
    }

}

