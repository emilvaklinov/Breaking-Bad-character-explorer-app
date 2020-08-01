//
//  ViewController.swift
//  Breaking Bad character explorer app
//
//  Created by Emil Vaklinov on 31/07/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    let cellIdentifier = "baseCell"
    let apiManager = APIManager()
    var selectedIndexPath: IndexPath?
   
    @IBOutlet var searchBar: UISearchBar!
  @IBOutlet var tableView: UITableView!
   
  override func viewDidLoad() {
    super.viewDidLoad()

}
}

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MasterViewCell  else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
    
        return cell
    }
    
    
}
