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
    
    var input = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let search = inputTextField.text!
        print(search)
        // Get a reference to the DetailViewController
        let resultsVC = segue.destination as! resultsViewController
        // Set the video property of the DetailViewController
        resultsVC.searchFor = search
    }
    
}


