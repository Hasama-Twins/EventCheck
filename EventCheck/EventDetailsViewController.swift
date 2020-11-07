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
    var postEventDateTime: String?
    var postURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventName.text = postEventName
        
        self.eventDateTime.text = postEventDateTime
        
        self.eventDescription.text = postEventDescription
        
        self.eventPhoto.af_setImage(withURL: postURL!)
        
        // Do any additional setup after loading the view.
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
