//
//  ListViewController.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import UIKit
import SwiftUI
class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let propertyViewModel = PropertyViewModel.shared
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Lista"
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(PropertyConstantTableViewCell.self, forCellReuseIdentifier: PropertyConstantTableViewCell.identifier)
        tableView.register(PropertyMutableTableViewCell.self, forCellReuseIdentifier: PropertyMutableTableViewCell.identifier)
        
        Task {
            try? await Task.sleep(nanoseconds: 200_000_000)
            tableView.reloadData()
        }
        refreshControl.addTarget(self, action: #selector(refreshFavorites), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    
    @objc private func refreshFavorites() {
            
            propertyViewModel.refreshFavorites()
            tableView.reloadData()
            refreshControl.endRefreshing()
        }
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return propertyViewModel.allProperties.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = propertyViewModel.allProperties[indexPath.section]
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyConstantTableViewCell.identifier, for: indexPath) as? PropertyConstantTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: property)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyMutableTableViewCell.identifier, for: indexPath) as? PropertyMutableTableViewCell else {
                return UITableViewCell()
            }
            let propertyBinding = Binding<Property>(
                get: { self.propertyViewModel.allProperties[indexPath.section] },
                set: { self.propertyViewModel.allProperties[indexPath.section] = $0 }
            )
            cell.configure(with: propertyBinding, toggleFavorite: { [weak self] in
                guard let self = self else { return }
                self.propertyViewModel.toggleFavorite(for: property.id)
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: indexPath.section)], with: .none)
            })
            
            return cell
        }
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 400 : 50 // Altura para la celda constante y mutable
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailView(
            property: Binding<Property>(
                get: { self.propertyViewModel.allProperties[indexPath.section] },
                set: { self.propertyViewModel.allProperties[indexPath.section] = $0 }
            ),
            detail: propertyViewModel.propertyDetail!,
            toggleFavorite: { [weak self] in
                guard let self = self else { return }
                self.propertyViewModel.toggleFavorite(for: self.propertyViewModel.allProperties[indexPath.section].id)
            }
        )

        let detailViewController = UIHostingController(rootView: detailView)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
