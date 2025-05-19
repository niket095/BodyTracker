//
//  Untitled.swift
//  BodyTracker
//
//  Created by Никита on 15.05.2025.

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var set: Int
    @Persisted var reps: Int
    @Persisted var timer: Int
}


