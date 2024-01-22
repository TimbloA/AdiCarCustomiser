//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Adi Timblo on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var enginePackage = false
    @State private var brakesPackage = false
    
    @State private var remainingFunds = 1000
    
    
    var brakesPackageEnabled: Bool {
        if remainingFunds - 500 >= 0 {
            return false
        }else{
            return true
        }
    }
    
    var enginePackageEnabled: Bool {
        if remainingFunds - 500 < 0 {
            return true
        }else{
            return false
        }
    }
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds - 500 < 0 {
            return true
        }else{
            return false
        }
    }
    
    var tiresPackageEnabled: Bool {
        if remainingFunds - 500 < 0 {
            return true
        }else{
            return false
        }
    }
    
        var body: some View {
            
            let exhaustPackageBinding = Binding<Bool> (
                get:  { self.exhaustPackage },
                set: { newValue in
                    self.exhaustPackage = newValue
                    if newValue == true {
                        remainingFunds -= 500
                        starterCars.cars[selectedCar].topSpeed += 5
                        
                    }else {
                        starterCars.cars[selectedCar].topSpeed -= 5
                        remainingFunds += 500
                    }
                }
            )
            let tiresPackageBinding = Binding<Bool> (
                get:  { self.tiresPackage },
                set: { newValue in
                    self.tiresPackage = newValue
                    if newValue == true {
                        remainingFunds -= 500
                        starterCars.cars[selectedCar].handling += 2
                        
                    }else {
                        starterCars.cars[selectedCar].handling -= 2
                        remainingFunds += 500
                    }
                }
            )
            let enginePackageBinding = Binding<Bool> (
                get:  { self.enginePackage },
                set: { newValue in
                    self.enginePackage = newValue
                    if newValue == true {
                        starterCars.cars[selectedCar].acceleration -= 1
                        starterCars.cars[selectedCar].topSpeed += 2
                        remainingFunds -= 1000
                        
                    }else {
                        starterCars.cars[selectedCar].acceleration += 1
                        starterCars.cars[selectedCar].topSpeed -= 2
                        remainingFunds += 1000
                    }
                }
            )
            let brakesPackageBinding = Binding<Bool> (
                get:  { self.brakesPackage },
                set: { newValue in
                    self.brakesPackage = newValue
                    if newValue == true {
                        remainingFunds -= 500
                        starterCars.cars[selectedCar].handling += 1
                        
                    }else {
                        starterCars.cars[selectedCar].handling -= 1
                        remainingFunds += 500
                    }
                }
            )
            
            VStack{
                Form {
                    VStack(alignment: .leading, spacing:20){
                        
                        Text("\(starterCars.cars[selectedCar].displayStats())")
                        
                        Button("Next Car", action: {
                            if selectedCar == (self.starterCars.cars.count)-1{
                                selectedCar = -1
                            }
                            selectedCar += 1
                        resetDisplay()})
                    }
                    Section {
                        Toggle("Brakes Package Cost: $500", isOn: brakesPackageBinding).disabled(brakesPackageEnabled)
                        Toggle("Engine Package Cost: $1000", isOn: enginePackageBinding).disabled(enginePackageEnabled)
                        Toggle("Exhaust Package Cost: $500", isOn: exhaustPackageBinding).disabled(exhaustPackageEnabled)
                        Toggle("Tires Package Cost: $500", isOn: tiresPackageBinding).disabled(tiresPackageEnabled)
                        
                    }
                }
                Text("Remaining Funds: $\(remainingFunds)")
                    .foregroundColor(.red)
                    .baselineOffset(20)
            }
        }
    func resetDisplay() {
        brakesPackage = false
        exhaustPackage = false
        enginePackage = false
        tiresPackage = false
        remainingFunds = 1000
    }
}

#Preview {
    ContentView()
}
