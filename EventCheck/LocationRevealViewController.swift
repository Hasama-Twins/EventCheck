//
//  LocationRevealViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit

class LocationRevealViewController: UIViewController {
    
    
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventDateTime: UILabel!
    @IBOutlet weak var eventName: UILabel!
    
    
    var postEventName: String?
    var postEventDateTime: String?
    var postEventLocation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventName.text = postEventName
        
        self.eventDateTime.text = postEventDateTime
        
        self.eventLocation.text = postEventLocation
        
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
