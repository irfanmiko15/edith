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
    @Published var indexChallenge:Int = 0
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var picDataNeed:[UIImage] = [UIImage(),UIImage(),UIImage(),UIImage(),UIImage()]
    @Published var picDataWant:[UIImage] = [UIImage(),UIImage(),UIImage(),UIImage(),UIImage()]
    @Published var isImageFilled:Bool=false
    @Published var listPrompt:[ChallengeModel]=[ChallengeModel(prompt: "Keren! Sekarang kalian sudah paham tentang kebutuhan dan keinginan", edithImage: "edithBahagia", buttonText: "NEXT", listImage: []),ChallengeModel(prompt: "Sebagai penutup, aku punya tantangan yang seru untuk kalian!", edithImage: "edithBahagia", buttonText: "NEXT", listImage: []),ChallengeModel(prompt: "Ambil masing-masing 5 foto barang yang merupakan kebutuhan dan keinginan", edithImage: "edithMenyapa", buttonText: "NEXT", listImage: []),ChallengeModel(prompt: "Setelah itu, kita akan mendiskusikan gambar-gambar yang sudah kalian ambil", edithImage: "edithMenyapa", buttonText: "OK", listImage: []),ChallengeModel(prompt: "", edithImage: "", buttonText: "", listImage: []),ChallengeModel(prompt: "Ayo kita diskusikan gambar-gambar yang sudah kalian ambil bersama!", edithImage: "edithMenyapa", buttonText: "Ayo", listImage: []),ChallengeModel(prompt: "", edithImage: "", buttonText: "", listImage: []),ChallengeModel(prompt: "Luar biasa! Kalian sudah berhasil memahami kebutuhan dan keinginan", edithImage: "edithMenyapa", buttonText: "Ayo", listImage: []),ChallengeModel(prompt: "Ini baru permulaan, petualangan kita selanjutnya akan jauh lebih menyenangkan!", edithImage: "edithMenyapa", buttonText: "Selesai", listImage: [])]
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
            
            self.preview.connection?.videoOrientation = .landscapeRight
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
        if(indexChallenge==0){
            if let index = picDataNeed.firstIndex(where: {$0.cgImage == nil}) {
                picDataNeed[index]=image!
            }
        }
        else{
            if let index = picDataWant.firstIndex(where: {$0.cgImage == nil}) {
                picDataWant[index]=image!
            }
        }
        checkPhotoValue()
    }
    
    func deleteImage(index:Int){
        if(indexChallenge==0){
            picDataNeed.remove(at: index)
            picDataNeed.append(UIImage())
        }
        else{
            picDataWant.remove(at: index)
            picDataWant.append(UIImage())
        }
        checkPhotoValue()
    }
    
    func stopCamera(){
        self.session.stopRunning()
    }
    
    func checkPhotoValue(){
        if(indexChallenge==0){
            for i in picDataNeed.indices{
                if(i==picDataNeed.count-1){
                    if(picDataNeed[i].cgImage != nil){
                        isImageFilled=true
                    }
                    else{
                        isImageFilled=false
                    }
                }
            }
        }
        else{
            for i in picDataWant.indices{
                if(i==picDataWant.count-1){
                    if(picDataWant[i].cgImage != nil){
                        isImageFilled=true
                    }
                    else{
                        isImageFilled=false
                    }
                }
            }
        }
        
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
