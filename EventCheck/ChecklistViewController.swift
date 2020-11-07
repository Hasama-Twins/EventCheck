//
//  ChecklistViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit

class ChecklistViewController: UIViewController {

    @IBOutlet weak var checkMarkStatusLabel: UILabel!
    
    var postEventDateTime: String?
    var postEventName: String?
    var postEventLocation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkMarkStatusLabel.textColor = UIColor.white
        
        self.continueButton.setTitleColor(.white, for: UIControl.State.normal)
        
        // Do any additional setup after loading the view.
    }
    var count: Int=0
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    
    @IBOutlet weak var button11: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    
    
    @IBAction func button1(_ sender: Any) {
        self.button1.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
        
    }
        
    
    @IBAction func button2(_ sender: Any) {
        self.button2.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button3(_ sender: Any) {
        self.button3.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button4(_ sender: Any) {
        self.button4.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button5(_ sender: Any) {
        self.button5.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button6(_ sender: Any) {
        self.button6.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    
    @IBAction func button7(_ sender: Any) {
        self.button7.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    
    
    @IBAction func button8(_ sender: Any) {
        self.button8.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button9(_ sender: Any) {
        self.button9.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button10(_ sender: Any) {
        self.button10.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func button11(_ sender: Any) {
        self.button11.setImage(UIImage(systemName: "checkmark.square"), for: UIControl.State.normal)
        count += 1
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if count >= 11 {
            self.checkMarkStatusLabel.text = "Glad you do not have COVID-19 symptoms"
            self.checkMarkStatusLabel.textColor = UIColor.black
            self.continueButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        }else{
            self.checkMarkStatusLabel.text = "If you are feeling ill, you may not attend this event. Please schedule a COVID-19 test."
            self.checkMarkStatusLabel.textColor = UIColor.black
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let maskViewController = segue.destination as! MaskViewController
        maskViewController.postEventName = postEventName
        maskViewController.postEventDateTime = postEventDateTime
        maskViewController.postEventLocation = postEventLocation as! String
    }
    

}
