//
//  ProfileViewController.swift
//  Parsing
//
//  Created by pras on 7/6/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myPhone: UITextField!
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(myName.text, forKey: "username")
    }
    
    @IBAction func btnGet(_ sender: Any) {
        let defaults = UserDefaults.standard
        let data = defaults.value(forKey: "username")
        myName.text = data as! String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "myImage")!
        let circularImage = image.af_imageRoundedIntoCircle()
        
        myImage.image = circularImage
        
        // ambil data persistent
        let defaults = UserDefaults.standard
        let data = defaults.value(forKey: "username")
        myName.text = data as! String?
        
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
