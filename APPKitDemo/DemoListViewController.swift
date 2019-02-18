//
//  MasterViewController.swift
//  APPKitDemo
//
//  Created by chai.chai on 2019/1/23.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import APPKit

class DemoListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    private var classNames = [String]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "APPKit Demos"
        view.backgroundColor = UIColor.white

        classNames = subClassesForClass(BaseViewController.self)
        classNames.remove(NSStringFromClass(DemoListViewController.self))
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = classNames[indexPath.row].components(separatedBy: ".").last
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

func subClassesForClass(_ clazz: AnyClass) -> [String] {
    var count: UInt32 = 0
    let classList = objc_copyClassList(&count)!
    var classNames: [String] = []

    for idx in 0..<Int(count) {
        var aClass: AnyClass? = classList[idx]

        repeat {
            aClass = class_getSuperclass(aClass)
        } while aClass != nil && aClass != clazz

        guard aClass != nil else { continue }

        let className = String(cString: class_getName(classList[idx]))
        classNames.append(className)
    }

    return classNames.sorted()
}
