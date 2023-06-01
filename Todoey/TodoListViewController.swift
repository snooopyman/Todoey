//
//  ViewController.swift
//  Todoey
//
//  Created by Armando Cáceres on 31/5/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Buy Eggs", "Buy Water", "Buy Meat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation Bar apareance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    
    }
    
    //MARK: -  TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //un check para las row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //para que no se quede marcado de gris cuando hacemos tap
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}

