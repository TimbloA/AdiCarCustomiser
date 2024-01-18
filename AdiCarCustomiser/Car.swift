//
//  Car.swift
//  AdiCarCustomiser
//
//  Created by Adi Timblo on 18/01/2024.
//

import Foundation

struct Car {
    
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        var output: String
        output = """
                    Car Make: \(make)
                    Model: \(model)
                    Top Speed: \(topSpeed)mph
                    Acceleration (0-60): \(acceleration)s
                    Handling: \(handling)
                """
        return output
    }
}
