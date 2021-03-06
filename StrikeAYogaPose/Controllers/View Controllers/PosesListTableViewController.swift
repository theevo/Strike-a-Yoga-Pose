//
//  PosesListTableViewController.swift
//  StrikeAYogaPose
//
//  Created by theevo on 3/11/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class PosesListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPoses()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PoseController.shared.allPoses.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "poseCell", for: indexPath) as? PoseTableViewCell else { return UITableViewCell() }
        
        let pose = PoseController.shared.allPoses[indexPath.row]
        
        cell.setPose(pose: pose)
        
        return cell
    }
    
    
    // MARK: - Helper Functions
    
    func fetchPoses() {
        PoseController.shared.fetchPoses { (result) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(_):
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
} // end PosesListTableViewController
