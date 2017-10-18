//
//  imageFeed.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit


// This is the only line of code you should be modifying
var threads: [String: [[UIImage:CFAbsoluteTime]]] = ["memes": [], "dog spots": [], "random": []]
var readOrNo: [String: [Int]] = ["memes": [], "dog spots": [], "random": []]

let threadNames = ["memes", "dog spots", "random"]
var allImages: [UIImage] = [UIImage(named: "dog1")!,
                            UIImage(named: "meme1")!,
                            UIImage(named: "other1")!,
                            UIImage(named: "dog2")!,
                            UIImage(named: "meme2")!,
                            UIImage(named: "other2")!,
                            UIImage(named: "dog3")!,
                            UIImage(named: "meme3")!,
                            UIImage(named: "other3")!]
