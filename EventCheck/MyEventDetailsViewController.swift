//
//  MyEventDetailsViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/7/20.
//

import UIKit
import Parse
import AlamofireImage

class MyEventDetailsViewController: UIViewController {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventPhoto: UIImageView!
    @IBOutlet weak var eventDateTime: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var registerCountLabel: UILabel!
    @IBOutlet weak var isRegisteredButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    
    var postEventName: String?
    var postEventDescription: String?
    var postEventDateTime: Date?
    var postURL: URL?
    var postEventLocation: String?
    var postEventNumerator: Int!
    var postEventDenominator: Int!
    var postEventRegistered: Bool?
    
    @IBAction func onRegisterButton(_ sender: Any) {
        self.isRegisteredButton.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        postEventRegistered = true
        let query = PFQuery(className:"Event")
        query.whereKey("name", contains: postEventName)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil{
                if let events = objects{
                    print(events)
                    for event in events{
                        event["isregistered"] = true
                        event["registeredcount"] = event["registeredcount"] as! Int + 1
                        self.postEventNumerator = self.postEventNumerator! + 1
                        self.viewDidLoad()
                        event.saveInBackground()

                    }
                }
            }
        }
        if postEventNumerator!/postEventDenominator! == 1{
            self.registerCountLabel.text = "Event Full"
        } else {
            self.registerCountLabel.text = "\(postEventNumerator!)/\(postEventDenominator!) Registered"
    }
    }

    
    @IBOutlet weak var accessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventName.text = postEventName
        
        let date = postEventDateTime
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "PST") as TimeZone?
        formatter.dateFormat = "MMM d y, h:mm a"
        self.eventDateTime.text = formatter.string(from: date as! Date)
        
        self.eventDescription.text = postEventDescription
        
        self.eventPhoto.af_setImage(withURL: postURL!)

        
        if postEventRegistered == true {
            self.isRegisteredButton.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
            
            let soon = Date().addingTimeInterval(1800)
            if date! <= soon {
                self.accessButton.setTitleColor(.systemBlue, for: .normal)
                self.accessButton.setTitle("Get Access", for: .normal)
            } else {
                self.accessButton.setTitleColor(.systemGray2, for: .normal)
                self.accessButton.setTitle("Wait to Access", for: .normal)
            }
        } else {
            self.accessButton.setTitleColor(.systemGray2, for: .normal)
            self.accessButton.setTitle("Access Denied", for: .normal)
            
            }
        
        if postEventNumerator!/postEventDenominator! == 1{
            self.registerCountLabel.text = "Event Full"
            if postEventRegistered == false{
                self.registerLabel.textColor = .white
                self.isRegisteredButton.isHidden = true
            }
        } else {
            self.registerCountLabel.text = String(postEventNumerator ?? 0) + "/" + String(postEventDenominator) + " Registered"
            
        
        // Do any additional setup after loading the view.
    }
    }


}
