//
//  EventDetailsViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit
import Parse
import AlamofireImage

class EventDetailsViewController: UIViewController {
    


    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventPhoto: UIImageView!
    @IBOutlet weak var eventDateTime: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    var postEventName: String?
    var postEventDescription: String?
    var postEventDateTime: Date?
    var postURL: URL?
    var postEventLocation: String?
    var postEventNumerator: Int?
    var postEventDenominator: Int?
    var postEventRegistered: Bool?
    
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
        
        let soon = Date().addingTimeInterval(1800)
        if date! <= soon {
            self.accessButton.setTitleColor(.systemBlue, for: .normal)
            self.accessButton.setTitle("Get Access", for: .normal)
        } else {
            self.accessButton.setTitleColor(.systemGray2, for: .normal)
            self.accessButton.setTitle("Wait to Access", for: .normal)

        }
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        if identifier == "AccessSegue" {
            let checklistViewController = segue.destination as! ChecklistViewController
            checklistViewController.postEventName = postEventName
            checklistViewController.postEventLocation = postEventLocation as! String
            
            let date = postEventDateTime
            let formatter = DateFormatter()
            formatter.timeZone = NSTimeZone(name: "PST") as TimeZone?
            formatter.dateFormat = "MMM d y, h:mm a"
            checklistViewController.postEventDateTime = formatter.string(from: date as! Date)
            
        }
        
        
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
