//
//  ViewController2.swift
//  Parsing
//
//  Created by pras on 6/29/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var pesan : String!
    
    @IBOutlet weak var myLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myLabel.text = pesan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
