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
    
    static func fetchYogaGlyph( pose: Pose, completion: @escaping (Result<UIImage, PoseError>) -> Void ) {
        let glyphURL = pose.imageURL
        
        var request = URLRequest(url: glyphURL)
        request.httpMethod = "GET"
        request.setValue("image/svg+xml", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in

            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.invalidURL))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            guard let glyph = UIImage(data: data) else { return completion(.failure(.badData)) }
            
            return completion(.success(glyph))
            
        }.resume()
    } // end fetchYogaGlyph
    
} // end PoseController
