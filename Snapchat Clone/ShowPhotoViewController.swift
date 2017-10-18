//
//  ShowPhotoViewController.swift
//  Snapchat Clone
//
//  Created by Neha Kompella on 10/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {

    var image:UIImage = UIImage(named:"dog1")!
    
    @IBOutlet var imageX: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        imageX.image = image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageX.isUserInteractionEnabled = true
        imageX.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.viewDidAppear(false)
    }

}
