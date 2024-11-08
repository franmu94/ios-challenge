//
//  ListViewController.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let propertyViewModel = PropertyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Lista de Propiedades"
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PropertyCell")
        view.addSubview(tableView)
        
        Task {
            await loadProperties()
        }
    }
    
    func loadProperties() async {
        await propertyViewModel.getProperties()
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyViewModel.allProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        let property = propertyViewModel.allProperties[indexPath.row]
        cell.textLabel?.text = property.address
        cell.imageView?.image = UIImage(systemName: "house")
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let property = propertyViewModel.allProperties[indexPath.row]
//        let detailVC = PropertyDetailViewController(property: property)
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}
