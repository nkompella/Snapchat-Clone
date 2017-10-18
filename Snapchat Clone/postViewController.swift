//
//  PostViewController.swift
//  Snapchat Clone
//
//  Created by Neha Kompella on 10/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var postTableView: UITableView!
    @IBOutlet var postButton: UIButton!
    @IBOutlet var feedSelected: UILabel!
    var selectedFeed = 0
    var selectedPic:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        postTableView.delegate = self
        feedSelected.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedSelected.text = threadNames[indexPath.row]
        selectedFeed = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postFeedCell") as! PostTableViewCell
        let feedName = threadNames[indexPath.row]
        cell.postFeedSection.text = feedName
        return cell
    }
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        if feedSelected.text != "" {
            if let image = selectedPic {
                threads[threadNames[selectedFeed]]?.append([image:CFAbsoluteTimeGetCurrent()])
                readOrNo[threadNames[selectedFeed]]?.append(0)
  
                let alertController = UIAlertController(title: "Sent!", message:
                    "Your snap has sent!", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: {(_)in
                    _ = self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
