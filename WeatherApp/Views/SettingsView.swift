//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 19.09.2024.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    
    // MARK: - Properties
    private var viewModel: SettingsViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions and Helpers
    
    private func setupUI(){
        //TableView - and constraints
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

    public func configure(with viewModel: SettingsViewModel){
        self.viewModel = viewModel
    }
}
// MARK: - Extension for TableView
extension SettingsView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.option.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        if let viewModel {
            cell.textLabel?.text = viewModel.option[indexPath.row].title
        }
        return cell
    }
    
 
    
}
