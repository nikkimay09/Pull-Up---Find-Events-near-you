//
//  EventsViewController.swift
//  Xplore
//
//  Created by Nikki Bandaru on 11/29/21.
//

import UIKit
import AlamofireImage

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var events = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.

        
        //https://api.seatgeek.com/2/events?client_id=MjQ2ODcwMTF8MTYzODIzMjU1NC40NTMxNjc&client_secret=8a78f422ab9c71d773cb3d34a77db0bf00b500091f8d658aa437dc3033db93d2
        
        let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjQ2ODcwMTF8MTYzODIzMjU1NC40NTMxNjc")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 self.events = dataDictionary["events"] as! [[String:Any]]
                 self.tableView.reloadData()
                 
                 

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        
        let event = events[indexPath.row]
        let venue: Dictionary = event["venue"] as! Dictionary<String, Any>
        let title = venue["name_v2"] as! String
        let type = event["type"] as! String
        let time = event["datetime_local"] as! String
        
        cell.NameLabel.text = title
        cell.TypeLabel.text = type
        cell.timeLabel.text  = "Date & Time: \n" + time
        
        let perform = event["performers"] as! Array<Any>
        let dic = perform[0] as! Dictionary<String, Any>
        let posterPath = dic["image"] as! String
        let posterUrl = URL(string: posterPath)

        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }
    
}
