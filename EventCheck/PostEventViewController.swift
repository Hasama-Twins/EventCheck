//
//  PostEventViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit
import AlamofireImage
import Parse

class PostEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBOutlet weak var eventDateTime: UIDatePicker!
    
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBAction func onExitKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPostButton(_ sender: Any) {
        let post = PFObject(className: "Event")
        
        post["name"] = eventName.text!
        post["description"] = eventDescription.text!
        post["datetime"] = eventDateTime.date
        post["location"] = eventLocation.text!
        
        let imageData = eventImage.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        
        
        post.saveInBackground { (success, error) in
            if success {
                print("saved")
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                print("error")
            }
        }
        
    }
    
    @IBAction func onPhotoButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        eventImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
