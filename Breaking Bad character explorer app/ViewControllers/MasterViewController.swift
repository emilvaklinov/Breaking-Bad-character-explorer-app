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
    var listOfCharacters = [Character]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfCharacters.count) Characters found"
            }
        }
    }
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

}


extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MasterViewCell  else {
        fatalError("The dequeued cell is not an instance of TableViewCell.")
    }
        let character = listOfCharacters[indexPath.row]
        cell.nameLabel.text = character.name
//        cell.imageCharacter.image = character.img
        cell.imageCharacter.image = UIImage(contentsOfFile: character.img!)
        return cell
    }
    
    
}


extension MasterViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        let apiManager = APIManager(characterName: searchBarText)
        apiManager.getCharacters { [weak self] result in
        switch result {
        case .failure(let error):
            print(error)
        case .success(let character):
            self?.listOfCharacters = character
        }
    }
    }
}
