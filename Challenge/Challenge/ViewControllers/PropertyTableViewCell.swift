//
//  PropertyTableViewCell.swift
//  Challenge
//
//  Created by Fran Malo on 12/11/24.
//

import UIKit
import SwiftUI




class PropertyConstantTableViewCell: UITableViewCell {
    static let identifier = "PropertyConstantTableViewCell"
    
    private var hostingController: UIHostingController<PropertyCellViewConstant>?

    func configure(with property: Property) {
        let cellView = PropertyCellViewConstant(property: property) {}
        
        if hostingController == nil {
            let hostingController = UIHostingController(rootView: cellView)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview(hostingController.view)
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            
            self.hostingController = hostingController
        } else {
            hostingController?.rootView = cellView
        }
    }
}

class PropertyMutableTableViewCell: UITableViewCell {
    static let identifier = "PropertyMutableTableViewCell"
    
    private var hostingController: UIHostingController<PropertyCellFavorite>?

    func configure(with property: Binding<Property>, toggleFavorite: @escaping () -> Void) {
        let cellView = PropertyCellFavorite(property: property, toggleFavorite: toggleFavorite)
        
        if hostingController == nil {
            let hostingController = UIHostingController(rootView: cellView)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview(hostingController.view)
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            
            self.hostingController = hostingController
        } else {
            hostingController?.rootView = cellView
        }
    }
}
