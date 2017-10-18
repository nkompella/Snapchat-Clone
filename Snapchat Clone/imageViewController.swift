//
//  ImageViewController.swift
//  Snapchat Clone
//
//  Created by Neha Kompella on 10/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//
import UIKit

class ImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet var imageTable: UITableView!
    var selectedImage:UIImage?
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageTable.delegate = self
        imageTable.dataSource = self
        
        refreshControl.addTarget(self,
                                 action: #selector(refreshOptions(sender:)),
                                 for: .valueChanged)
        imageTable.refreshControl = refreshControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc private func refreshOptions(sender: UIRefreshControl) {
        imageTable.reloadData()
        sender.endRefreshing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imageTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        let feed = threadNames[section]
        if let imageList = threads[feed] {

                return imageList.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! ImageTableViewCell
        var count = 0
        cell.username.text = "Neha"
        let feed = threadNames[indexPath.section]
        if let imageList = threads[feed] {
            for elem in imageList {
                for image in elem.keys {
                    if count == indexPath.row {
                        cell.imageLink = image
                        let min = UInt((CFAbsoluteTimeGetCurrent() - elem[image]!)/60)
                        cell.postTime.text = String(format: "%d minutes ago", min)
                        if readOrNo[threadNames[indexPath.section]]?[indexPath.row] == 1 {
                            cell.readBit.image = UIImage(named: "read")
                        } else {
                            cell.readBit.image = UIImage(named: "unread")
                        }
                        return cell
                    }
                    count = count + 1
                }
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ImageTableViewCell
        if cell.readBit.image != UIImage(named: "read") {
            cell.readBit.image = UIImage(named: "read")
            readOrNo[threadNames[indexPath.section]]?[indexPath.row] = 1
            selectedImage = cell.imageLink
            performSegue(withIdentifier: "cellToImageDisplay", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cellToImageDisplay" {
                if let dest = segue.destination as? ShowPhotoViewController {
                    if let image = selectedImage {
                        dest.image = image
                    }
                    
                }
            }
        }
    }

}
