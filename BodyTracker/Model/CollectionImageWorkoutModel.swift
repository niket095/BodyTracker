//

//  CollectionImageWorkoutModel.swift
//  BodyTracker
//
//  Created by Никита on 23.04.2025.
//
//

import Foundation

struct CollectionImageWorkoutModel {
    let image: String
    let name: String
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}

var imageArray: [CollectionImageWorkoutModel] = [
    
    CollectionImageWorkoutModel(image: "Biceps",
                          name: "Biceps"),
    
    CollectionImageWorkoutModel(image: "PullUps",
                          name: "Pull Ups"),
    
    CollectionImageWorkoutModel(image: "PushUps",
                          name: "Push Ups"),
    
    CollectionImageWorkoutModel(image: "Squarts",
                          name: "Squarts"),
    
    CollectionImageWorkoutModel(image: "Triceps",
                          name: "Triceps")]
    
extension CollectionImageWorkoutModel: Hashable {
    static func == (lhs: CollectionImageWorkoutModel, rhs: CollectionImageWorkoutModel) -> Bool {
        return lhs.name == rhs.name
    }
}

    
