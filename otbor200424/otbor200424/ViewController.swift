//
//  ViewController.swift
//  otbor200424
//
//  Created by Dariya on 20/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let network = Network()
    
    private let tableView = UITableView()
    
    private let cell = "cell"
    
    private var itemList: [ItemPerson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    
    private func initUI() {
        view.addSubview(tableView)
        setupConstraintsForTableView()
    }
    
    private func setupConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.register(PersonControllerCell.self, forCellReuseIdentifier: cell)
    }
    
    private func fetchProduct() {
        network.fetchProducts { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let model):
                self.itemList = model
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(model)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! PersonControllerCell
        cell.layer.cornerRadius = 11
        cell.clipsToBounds = true
        return cell
    }
    
    
}
