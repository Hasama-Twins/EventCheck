//
//  MaskViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit
import AlamofireImage
import Firebase

class MaskViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var postEventDateTime: String?
    var postEventName: String?
    var postEventLocation: String?

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var seeLocationButton: UIButton!
    
    
    @IBOutlet weak var maskStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.seeLocationButton.setTitleColor(.white, for: .normal)
    }
        // Do any additional setup after loading the view.
   
        
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage

        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSeeLocationButton(_ sender: Any) {
        let image = VisionImage(image: imageView.image!)
        print("image in vision")
        let options = VisionCloudImageLabelerOptions()
        options.confidenceThreshold = 0.6
        let labeler = Vision.vision().cloudImageLabeler(options: options)
        labeler.process(image) { labels, error in
            guard error == nil, let labels = labels else {
                return }
            var count = 0
            var maskBool = false

            // Task succeeded.
            // ...
            
            for label in labels {
                print(label.text)
                if ((label.text == "Mask" || label.text == "Face Mask" || label.text == "Medical equipment" || label.text == "Personal protective equipment") && maskBool == false){
                    maskBool = true
                    count += 1
                }
                if label.text == "Face"{
                    count += 1
                }
            }
            print(count)
            if count == 2 {
                self.seeLocationButton.setTitleColor(.systemBlue, for: .normal)
                self.maskStatusLabel.text = "Thanks for wearing your mask!"
            }
            else{
                self.maskStatusLabel.text = "Try again. Please take a selfie with your mask on."
            }
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let locationRevealViewController = segue.destination as! LocationRevealViewController
        locationRevealViewController.postEventName = postEventName
        locationRevealViewController.postEventDateTime = postEventDateTime
        locationRevealViewController.postEventLocation = postEventLocation as! String
    }
    

}

