//
//  PoseController.swift
//  StrikeAYogaPose
//
//  Created by theevo on 3/11/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class PoseController {
    
    // MARK: - Shared Instance and Source of Truth
    
    static let shared = PoseController()
    var allPoses: [Pose] = []
    
    // MARK: - Private Properties
    
    private static let baseURL = URL(string: "https://raw.githubusercontent.com/rebeccaestes/yoga_api/master/yoga_api.json")
    private static let imagePrefix = "pose_"
    

    // MARK: - READ/GET functions
    
    func fetchPoses( completion: @escaping ( Result<[Pose],PoseError> ) -> Void ) {
        //        1. URL
        guard let finalURL = PoseController.baseURL else { return completion(.failure(.invalidURL)) }
        
        
        //        2. Data Task (talk to Internet)
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            //        3. Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            //        4. Check for Data
            guard let data = data else { return completion(.failure(.noData)) }
            
            //        5. Decode Data
            do {
                let posesArray = try JSONDecoder().decode([Pose].self, from: data)
                self.allPoses = posesArray
                return completion(.success(posesArray))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.badData))
            }
            
        }.resume()
        
    } // end fetchPoses
    
    static func fetchYogaGlyph( pose: Pose ) -> UIImage {
        let poseId = String(pose.id)
        let imageName = imagePrefix + poseId
        guard let image = UIImage(named: imageName) else { return UIImage() }
        return image
    } // end fetchYogaGlyph
    
} // end PoseController
