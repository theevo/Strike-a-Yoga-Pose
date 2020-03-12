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
    
    override func viewWillAppear(_ animated: Bool) {
        print("hello world")
    }

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "poseCell", for: indexPath)

        let pose = PoseController.shared.allPoses[indexPath.row]
        
        cell.textLabel?.text = pose.englishName
        cell.detailTextLabel?.text = pose.sanskritName

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
