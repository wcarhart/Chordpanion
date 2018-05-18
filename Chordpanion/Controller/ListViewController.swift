//
//  ListViewController.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/16/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var inputKey: String!
    var inputClassification: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProgressionCell", bundle: Bundle.main), forCellReuseIdentifier: "ProgressionCell")
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: determine data source - database? static? probably should be static for now
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ProgressionTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "ProgressionCell", for: indexPath) as? ProgressionTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "ProgressionCell", bundle: nil), forCellReuseIdentifier: "ProgressionCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "ProgressionCell") as? ProgressionTableViewCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: figure out how big this should be
        return 200.0
    }
}
