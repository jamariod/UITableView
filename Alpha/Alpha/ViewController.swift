//
//  ViewController.swift
//  Alpha
//
//  Created by Jamario Davis on 4/11/19.
//  Copyright © 2019 KAYCAM. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("sav") {
                pictures.append(item)
            }
        }
        title = "UITableView"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell 
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1: try loading the Detail view controller and typecasting it to be DetailViewController.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
        vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
        navigationController?.pushViewController(vc, animated: true) 
        }
    }
    // Used to change the color of the status bar
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
}

