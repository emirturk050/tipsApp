//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Emir Türk on 8.07.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var result: String?
    var split: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if split == nil {
            split = "2"
        }
        if tip == nil {
            tip = "10"
        }
        
        totalLabel.text  = result
        settingsLabel.text = "Split between \(split!) people, with %\(tip ?? "wrong") tip."
       
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
