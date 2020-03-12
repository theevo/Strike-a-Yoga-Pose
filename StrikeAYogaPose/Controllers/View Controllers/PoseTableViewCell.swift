//
//  PoseTableViewCell.swift
//  StrikeAYogaPose
//
//  Created by theevo on 3/11/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class PoseTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var poseNameLabel: UILabel!
    @IBOutlet weak var sanskritNameLabel: UILabel!
    
    
    // MARK: - Properties
    
    var pose: Pose?
    
    
    // MARK: - Helper Functions
    
    func setPose(pose: Pose) {
        self.pose = pose
        updateUI()
    }
    
    func updateUI() {
        guard let pose = pose else { return }
        poseNameLabel.text = pose.englishName
        sanskritNameLabel.text = pose.sanskritName
    }

}
