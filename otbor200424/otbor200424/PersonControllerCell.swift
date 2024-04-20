//
//  PersonControllerCell.swift
//  otbor200424
//
//  Created by Dariya on 20/4/24.
//

import UIKit

class PersonControllerCell: UITableViewCell {
    
    private let imagePersons: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 11
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let namePersons: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCellUI()
    }
    
    private func initCellUI() {
        contentView.addSubview(imagePersons)
        setupConstraintsForImagePersons()
        contentView.addSubview(namePersons)
        setupConstraintsForNamePersons()
    }
    
    private func setupConstraintsForImagePersons() {
        NSLayoutConstraint.activate([
            imagePersons.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePersons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imagePersons.heightAnchor.constraint(equalToConstant: 30),
            imagePersons.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupConstraintsForNamePersons() {
        NSLayoutConstraint.activate([
            namePersons.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            namePersons.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            namePersons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            namePersons.leadingAnchor.constraint(equalTo: imagePersons.leadingAnchor, constant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

