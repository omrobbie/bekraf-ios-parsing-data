//
//  ViewController.swift
//  Parsing
//
//  Created by pras on 6/29/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tInput: UITextField!
    
    let url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=9c04c6a25d15c5a8a20e1c0a16133557"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSend(_ sender: Any) {
        print(tInput.text!)
        
        Alamofire.request(url).responseJSON {
            response in print("Result: \(response.result)")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // tentukan tujuan
        let tujuan = segue.destination as! ViewController2
        
        // refer ke variabel tujuan
        tujuan.pesan = tInput.text!
    }
}
