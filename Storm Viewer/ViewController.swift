//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Çağatay Balıkçı on 1.02.2020.
//  Copyright © 2020 Çağatay Balıkçı. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var picture = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change Navigation controller title
        title = "Storm Viewer"
        // Large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("photo"){
                // this is a picture to load!
                picture.append(item)
                picture.sort()
            }
        }
        print(picture)
        
    }

    //: Table View Section
    // Number of Row Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count
    }
    
    // CellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picture[indexPath.row]
        return cell
    }
    
    // Loading image for DetailViewController
    // Did Select rowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = picture[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

