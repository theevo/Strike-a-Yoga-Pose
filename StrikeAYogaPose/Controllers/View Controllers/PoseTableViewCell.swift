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
    @IBOutlet weak var poseGlyphImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var pose: Pose?
    
    
    // MARK: - Helper Functions
    
    func setPose(pose: Pose) {
        self.pose = pose
        updateUI()
    }
    
    func updateUI() {
        guard let pose = pose else { return }
        
        self.poseNameLabel.text = pose.englishName
        self.sanskritNameLabel.text = pose.sanskritName
        
        PoseController.fetchYogaGlyph(pose: pose) { (result) in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let glyphImage):
                    self.poseGlyphImageView.image = glyphImage
                    
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
                
            }
            
        }
        
        
    }
    
}
