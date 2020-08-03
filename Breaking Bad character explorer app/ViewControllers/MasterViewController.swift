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
        var characters: [CharacterElement] = []
    //    var charactersData: [CharactersData] = []
    func search(_ text: String) {
        
        apiManager.searchFor(text) { [unowned self] outcome in
            
            switch outcome {
            case .failure(let errorString):
                print(errorString)
                
            case .success(let data):
                
                do {
                    let result = try JSONParser.parse(data, type: CharacterRoot.self)
                    self.characters = result.characters
//                    self.saveInCoreDataWith(array: [])
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                    
                } catch {
                    print("JSON Error: \(error)")
                }
                
            }
        }
    }
}


extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MasterViewCell
    
        return cell
    }
    
    
}
//extension BaseViewController: UITableViewDelegate {}

extension MasterViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(searchBar.text ?? "")
    }
    
}
