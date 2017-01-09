//
//  ViewController.swift
//  camtest1
//
//  Created by matt on 1/8/17.
//  Copyright © 2017 BoulevardLabs. All rights reserved.
//

import UIKit
import CameraManager

class ViewController: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    let cameraManager = CameraManager()

    @IBOutlet weak var cameraButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        cameraManager.showAccessPermissionPopupAutomatically = true
        //let currentCameraState = cameraManager.currentCameraStatus()
        addCameraToView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationController?.navigationBar.isHidden = true
        cameraManager.resumeCaptureSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cameraManager.stopCaptureSession()
    }
    
//    fileprivate func addCameraToView()
//    {
//        cameraManager.addPreviewLayerToView(cameraView, newCameraOutputMode: CameraOutputMode.stillImage)
//        cameraManager.showErrorBlock = { [weak self] (erTitle: String, erMessage: String) -> Void in
//            
//            let alertController = UIAlertController(title: erTitle, message: erMessage, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in  }))
//            
//            self?.present(alertController, animated: true, completion: nil)
//        }
//    }
    
    fileprivate func addCameraToView()
    {
    
        print(cameraManager.addPreviewLayerToView(self.cameraView))
        
    }
    
    @IBAction func buttonClick(_ sender: Any) {
       
        cameraManager.capturePictureWithCompletion({ (image, error) -> Void in
            if let errorOccured = error {
                print("error occured here.")
                self.cameraManager.showErrorBlock("Error occurred", errorOccured.localizedDescription)
            }
            else {
                print("no error - in let VC area")
                let vc: ImageViewController? = self.storyboard?.instantiateViewController(withIdentifier: "ImageVC") as? ImageViewController
                print("vc: \(vc)")
                print("vc created")
                if let validVC: ImageViewController = vc {
                    print("valid VC created")
                    if let capturedImage = image {
                        print("captured image created as image")
                        validVC.image = capturedImage
                        print("pushing to other view")
                    self.navigationController?.pushViewController(validVC, animated: true)
                        print("success?")
                    }
                }
            }
        })
  
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

