//
//  DetailViewController.swift
//  Breaking Bad character explorer app
//
//  Created by Emil Vaklinov on 31/07/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var detailedTableView: UITableView!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Dequeue the cell to display the user details
    let cell = detailedTableView.dequeueReusableCell(withIdentifier: "detailedCell", for: indexPath)
    return cell
    }
}


