//
//  SecondScreenViewController.swift
//  Private YT App
//
//  Created by macbook pro on 6/18/20.
//  Copyright © 2020 macbook pro. All rights reserved.
//


import UIKit
import YoutubePlayer_in_WKWebView
class SecondScreenViewController: UIViewController {

   var getUrl=""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       player.load(withVideoId: getUrl)
    }
    
  
    @IBOutlet weak var player: WKYTPlayerView!
    
    
    @IBAction func goBackBtn(_ sender: UIButton) {
    //self.performSegue(withIdentifier: "goBackSegue", sender: self)
        dismiss(animated: true,completion: nil)
    }
}

