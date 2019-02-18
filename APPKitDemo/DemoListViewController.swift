//
//  MasterViewController.swift
//  APPKitDemo
//
//  Created by chai.chai on 2019/1/23.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import APPKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView = UITableView(autoLayout: true)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "APPKit Demos"
        view.backgroundColor = UIColor.white

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
