//
//  ViewController.swift
//  CustomCamera
//
//  Created by Fardan Akhter on 08/07/2020.
//  Copyright © 2020 Tixsee. All rights reserved.
//
/*
======================================================

* This software and associated documentation files (the “Software”) is

* proprietary to Tixsee LLC.

* All rights reserved. The methods and

* techniques described herein are considered trade secrets

* and/or confidential. Reproduction or distribution, in whole

* or in part, is forbidden except by express written permission

* of Tixsee LLC.

LICENSE RESTRICTIONS

Except as expressly permitted under the License, or unless you have received prior written authorization from Tixsee LLC, you may not use, copy, modify, merge, publish, distribute, decompile, disclose, provide, create a derivative work of, or otherwise make available the Software.

Licenses may not be assigned, encumbered, sublicensed or transferred (whether directly or by operation of law) by the Licensee to any third party, and the Licensee will not grant any license, concession or other rights in or to any one or more of the Licenses to any third party.

See the file "LICENSE" for the full license governing this Software.

The above copyright notice and this license notice shall be included in all copies or substantial portions of the Software.

=============================================
*/

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var imagePreview: UIImageView!
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCapturePhotoOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        guard let backCamera =  AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Unable to access back camera!")
            return
        }
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
            //stillImageOutput?.outputSettings = [AVVideoCodecKey:  AVVideoCodecJPEG]
            if session!.canAddOutput(stillImageOutput!) {
                session!.addOutput(stillImageOutput!)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
                
                videoPreviewLayer!.videoGravity =    AVLayerVideoGravity.resizeAspectFill
                
                videoPreviewLayer!.connection?.videoOrientation =   AVCaptureVideoOrientation.portrait
                
                self.previewView.layer.addSublayer(videoPreviewLayer!)
                
                
                DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
                    self.session!.startRunning()
                    
                    DispatchQueue.main.async {
                        self.videoPreviewLayer?.frame = self.previewView.bounds
                    }
                }
                
                
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.session!.stopRunning()
    }
   
    
}

extension ViewController: AVCapturePhotoCaptureDelegate{

    @IBAction func takePhoto(_ sender: Any) {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        imagePreview.image = image
    }
    
    
}

