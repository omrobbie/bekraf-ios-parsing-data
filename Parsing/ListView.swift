//
//  ListView.swift
//  Parsing
//
//  Created by pras on 7/4/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ListView: UITableViewController {

    let url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=9c04c6a25d15c5a8a20e1c0a16133557"
    
    var arrayData : Array<Any>! = []
    var itemData : Dictionary<String, String>!
    var selectedIndex : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // panggil API
        Alamofire.request(url).responseJSON{
            response in
            let jsonData = JSON(response.result.value!)
            
            self.arrayData = jsonData["results"].arrayObject
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell

        // Configure the cell...
        
        // ambil data di index tertentu
        var item : Dictionary<String, Any>!
        item = self.arrayData[indexPath.row] as! Dictionary<String, Any>
        
        // tampilkan title
        cell.myTitle.text = item["original_title"] as? String
        
        // tampilkan rate
        let rate = item["vote_average"]!
        cell.myRate.text = "Rate: \(rate)"
        
        // tampilkan image
        let image = item["poster_path"] as! String
        let imagePath = "http://image.tmdb.org/t/p/w185/\(image)"
        
        // konversi ke URL
        let url = URL(string: imagePath)!
        
        // tampilkan image
        cell.myImageView.af_setImage(withURL: url)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ListDetail
        
        var data : Dictionary<String, Any>!
        data = self.arrayData[selectedIndex] as! Dictionary<String, Any>
        
        vc.item = data
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
