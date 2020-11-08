//
//  ThermometerViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/7/20.
//

import UIKit
import AlamofireImage
import Firebase
import MLKit

class ThermometerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var postEventDateTime: String?
    var postEventName: String?
    var postEventLocation: String?

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var seeLocationButton: UIButton!
    

    @IBOutlet weak var tempStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.seeLocationButton.setTitleColor(.white, for: .normal)
        // Do any additional setup after loading the view.
    }
    
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
    
    @IBAction func onConfirmTempButton(_ sender: Any) {
        let image = Firebase.VisionImage(image: imageView.image!)
        print("image in vision")
        let options = VisionCloudImageLabelerOptions()
        options.confidenceThreshold = 0.5
        let labeler = Vision.vision().cloudImageLabeler(options: options)
        labeler.process(image) { labels, error in
            guard error == nil, let labels = labels else {
                return }
            var count = 0

            // Task succeeded.
            // ...
            
            for label in labels {
                print(label.text)
                if (label.text == "Thermometer" || label.text == "Medical thermometer" || label.text == "Health care" ) {
                    count += 1
                }
            }
            print(count)
            if count > 0 {
                let image2 = MLKit.VisionImage(image: self.imageView.image!)
                let textRecognizer = TextRecognizer.textRecognizer()
                textRecognizer.process(image2) { result, error in
                  guard error == nil, let result = result else {
                    // Error handling
                    return
                  }
                    for block in result.blocks {
                        let blockText = block.text
                        print(blockText)
                        if (Float(blockText) ?? 101) <  100{
                            self.seeLocationButton.setTitleColor(.systemBlue, for: .normal)
                            self.tempStatusLabel.text = "Your tempurature looks good!"
                            }
                        }
                    }
                }
            else{
                self.tempStatusLabel.text = "Try again. Please take a close up photo of your thermometer"
            }
        }
        }
        
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let Location = segue.destination as! LocationRevealViewController
        Location.postEventName = postEventName
        Location.postEventDateTime = postEventDateTime
        Location.postEventLocation = postEventLocation!
    
    }

}


