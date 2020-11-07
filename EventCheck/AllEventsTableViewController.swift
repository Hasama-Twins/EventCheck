//
//  AllEventsTableViewController.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/6/20.
//

import UIKit
import Parse
import AlamofireImage

class AllEventsTableViewController: UITableViewController {
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className:"Event")
        query.limit = 20
        print("viewdid appear")
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(posts.count)
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllEventsTableViewCell") as! AllEventsTableViewCell

        // Configure the cell...
        let post = posts[indexPath.row]
        
        cell.eventName.text = post["name"] as! String
        
        let date = post["datetime"]
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "PST") as TimeZone?
        formatter.dateFormat = "MMM d y, h:mm a"
        cell.eventDateTime.text = formatter.string(from: date as! Date)
        
        cell.eventDescription.text = post["description"] as! String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.eventPhoto.af_setImage(withURL: url)
        
        return cell


    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let postEventDescription = posts[indexPath!.row]["description"] as! String
        let postEventName = posts[indexPath!.row]["name"] as! String
        
        let date = posts[indexPath!.row]["datetime"]
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "PST") as TimeZone?
        formatter.dateFormat = "MMM d y, h:mm a"
        let postEventDateTime = formatter.string(from: date as! Date)
        
        let imageFile = posts[indexPath!.row]["image"] as! PFFileObject
        let urlString = imageFile.url!
        let postURL = URL(string: urlString)!
        
        
        
        let eventDetailsViewController = segue.destination as! EventDetailsViewController
        eventDetailsViewController.postEventDescription = postEventDescription
        eventDetailsViewController.postEventName = postEventName
        eventDetailsViewController.postEventDateTime = postEventDateTime
        eventDetailsViewController.postURL = postURL
        
        
        
        
        tableView.deselectRow(at: indexPath!, animated: true)
    }
   

}
