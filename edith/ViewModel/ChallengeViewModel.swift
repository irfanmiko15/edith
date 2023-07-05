//
//  ChallengeViewModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 05/07/23.
//

import Foundation
import AVFoundation
import SwiftUI
import UIKit
class ChallengeViewModel : NSObject,ObservableObject,AVCapturePhotoCaptureDelegate{
    
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var picData:[UIImage] = [UIImage(),UIImage(),UIImage(),UIImage(),UIImage()]
    func check(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
              }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
            }
        }
    func setUp(){
        do{
            self.session.beginConfiguration()
            
            let device=AVCaptureDevice.default(.builtInWideAngleCamera , for : .video , position : .back)
                let input = try AVCaptureDeviceInput(device:device!)
                if self.session.canAddInput(input){
                    self.session.addInput(input)
                }
                if self.session.canAddOutput(self.output){
                    self.session.addOutput(self.output)
                }
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func takePic(){
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil{
            return
        }
        print("pic taken")
        
        guard let imageData = photo.fileDataRepresentation() else{return}
        let image = UIImage(data: imageData)
        if let index = picData.firstIndex(where: {$0.cgImage == nil}) {
            picData[index]=image!
        }
        
        
    }
    func deleteImage(index:Int){
        picData.remove(at: index)
        picData.append(UIImage())
    }
}

struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera : ChallengeViewModel
    func makeUIView(context:Context)-> UIView{
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        camera.preview.connection?.videoOrientation = .landscapeRight
        camera.preview.connection?.videoPreviewLayer?.frame = view.bounds
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
       
    }
    
   
}
