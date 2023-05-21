//
//  ViewController.swift
//  MVVM_Example2
//
//  Created by Nazar Kopeyka on 11.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { /* 4 */
    
    @IBOutlet var tableView: UITableView! /* 1 */
    
//    var data = ["one", "two", "three"] /* 13 */
    var data = [ /* 15 */
        Person(firstName: "Dan", lastName: "KPK", gender: "male", age: 25, height: 144), /* 16 */
        Person(firstName: "Betty", lastName: "KPK", gender: "male", age: 25, height: 144), /* 17 */
        Person(firstName: "John", lastName: "KPK", gender: "male", age: 25, height: 144) /* 18 */

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier) /* 29 */
        tableView.delegate = self /* 2 */
        tableView.dataSource = self /* 3 */
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /* 9 */
        return data.count /* 10 */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /* 5 */
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell /* 6 */ /* 30 change "cell" and add as! */
        
        let model = data[indexPath.row] /* 20 */
        let viewModel = CellViewModel(firstName: model.firstName, lastName: model.lastName) /* 21 */
        
//        cell.textLabel?.text = "\(viewModel.firstName) \(viewModel.lastName)" /* 7 */ /* 22 change data[indexPath.row].firstName */
        cell.configure(with: viewModel) /* 31 */
        return cell /* 8 */
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { /* 11 */
        tableView.deselectRow(at: indexPath, animated: true) /* 12 */
    }
}

struct Person { /* 14 */
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
}

struct CellViewModel { /* 19 */
    let firstName: String
    let lastName: String
}
