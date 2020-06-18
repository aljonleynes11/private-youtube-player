//
//  ViewController.swift
//  Private YT App
//
//  Created by macbook pro on 6/17/20.
//  Copyright © 2020 macbook pro. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
class ViewController: UIViewController {

   
    @IBOutlet weak var textField: UITextField!
    
    var passUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }

    @IBAction func goNextBtn(_ sender: UIButton) {
        self.passUrl=textField.text!
        print("Go next")
       
        
        let ytUrl = textField.text!
        if ytUrl.contains("www.youtube.com") && ytUrl.count > 17
        {
            let ytUrl2 = textField.text?.replacingOccurrences(of: "https://www.youtube.com/watch?v=", with: "")
            self.passUrl = ytUrl2!
            textField.text = ""
            self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
            
        }
        else if ytUrl.contains("https://youtu.be/") && ytUrl.count > 17
        {
            let ytUrl2 = textField.text?.replacingOccurrences(of: "https://youtu.be/", with: "")
            self.passUrl = ytUrl2!
            textField.text = ""
            self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
            
        }
        else if ytUrl.contains("www.youtube.com") == false || ytUrl.contains("https://youtu.be/") == false || ytUrl.count <= 17
        {
            print("Please enter valid youtube url -- to be fixed, show alert if invalid url")
            //self.present(alert, animated: true, completion: nil)
            
        }
        else
        {
            print("Text box is nil")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fromViewController = segue.destination as! SecondScreenViewController
        fromViewController.getUrl=self.passUrl
   } 
}
