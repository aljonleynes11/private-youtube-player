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
        
        let ytUrl = textField.text!
        if ytUrl.contains("www.youtube.com") && ytUrl.count > 17
        {
            let ytUrl2 = textField.text?.replacingOccurrences(of: "https://www.youtube.com/watch?v=", with: "")
             self.passUrl = ytUrl2!
            goNext()
        }
        else if ytUrl.contains("https://youtu.be/") && ytUrl.count > 17
        {
            let ytUrl2 = textField.text?.replacingOccurrences(of: "https://youtu.be/", with: "")
             self.passUrl = ytUrl2!
            goNext()
        }
        else if ytUrl.contains("www.youtube.com") == false || ytUrl.contains("https://youtu.be/") == false || ytUrl.count <= 17
        {
            showAlert()
        }
        else
        {
            showAlert()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fromViewController = segue.destination as! SecondScreenViewController
        fromViewController.getUrl=self.passUrl
   }
    
    func showAlert(){
        let alert = UIAlertController(title: "Invalid YouTube URL", message: "Please enter a valid YouTube URL", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        textField.text=""
    }
    func goNext(){
       
        textField.text = ""
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
    }
     
}
