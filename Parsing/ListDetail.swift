//
//  ListDetail.swift
//  Parsing
//
//  Created by pras on 7/4/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit

class ListDetail: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var overview: UITextView!
    
    var item : Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // tampilkan title
        self.title = item["original_title"] as? String
        
        // ambil data image
        let image = item["poster_path"] as! String
        let imagePath = "http://image.tmdb.org/t/p/w185/\(image)"
        
        // konversi ke URL
        let url = URL(string: imagePath)!
        
        // tampilkan image
        self.img.af_setImage(withURL: url)
        
        // tampilkan deskripsi
        overview.text = item["overview"] as! String
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
