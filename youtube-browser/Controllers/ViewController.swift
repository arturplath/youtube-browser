//
//  ViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    // Open my Linkedin in Safari
    @IBAction func linkedinClicked(_ sender: Any) {
        UIApplication.shared.open(Constants.linkedinURL!, options: [:], completionHandler: nil)
    }
    
    // Open my github in Safari
    @IBAction func githubClicked(_ sender: Any) {
        UIApplication.shared.open(Constants.githubURL!, options: [:], completionHandler: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "YouTube Browser"
        inputTextField.delegate = self
    }
    
    // Hit return to see results
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
    
    // Give searching keywords to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let search = inputTextField.text!
        // Get a reference to the DetailViewController
        let resultsVC = segue.destination as! ResultsViewController
        // Set the video property of the DetailViewController
        resultsVC.searchFor = search
    }
    
}


