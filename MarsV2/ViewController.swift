//
//  ViewController.swift
//  MarsV2
//
//  Created by Release on 2018. 5. 18..
//  Copyright © 2018년 parkjain. All rights reserved.
//

import UIKit

enum Feature: Int {
    case solarPanels = 0, greenhouses, size }


struct SolarPanelDataSource {
    let values = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
    
    func title(for index: Int) -> String? {
        guard index < values.count else {return nil}
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}

struct GreenhousesDataSource {
    let values = [1,  2,  3,  4,  5]
    
    func title(for index: Int) -> String? {
        guard index < values.count else {return nil}
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}

struct SizeDataSource {
    let values = [750, 1000, 1500, 2000, 3000, 4000, 5000, 10_000]
    
    func title(for index: Int) -> String? {
        guard index < values.count else {return nil}
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self
            
     //       let features: [Feature] = [.solarPanels, .greenhouses, .size]
            
         //   for feature in features {
              //  pickerView.selectRow(2, inComponent: feature.rawValue, animated: false)
          //      print("feature.rawValue=",feature.rawValue)
         //   }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(" Selected row=",row)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let feature = Feature(rawValue: component) else {
            fatalError("Invalid component \(component) found to represent a \(Feature.self). This should not happen based on the configuration set in the storyboard.")
        }
        
        return self.title(for: row, feature: feature)
    }
    
    
        private let solarPanelsDataSource = SolarPanelDataSource()
        private let greenhousesDataSource = GreenhousesDataSource()
        private let sizeDataSource = SizeDataSource()
        
        func title(for row: Int, feature: Feature) -> String? {
            
            switch feature {
            case .solarPanels: return solarPanelsDataSource.title(for: row)
            case .greenhouses: return greenhousesDataSource.title(for: row)
            case .size: return sizeDataSource.title(for: row)
            }
        
        }
    
    func value(for row: Int, feature: Feature) -> Double? {
        let value: Double?
        
        switch feature {
        case .solarPanels: return solarPanelsDataSource.value(for: row)
        case .greenhouses: return greenhousesDataSource.value(for: row)
        case .size: return sizeDataSource.value(for: row)
        }
        
        return value!
        
    }
    
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 3
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch Feature(rawValue: component)! {
            case .solarPanels: return solarPanelsDataSource.values.count
            case .greenhouses: return greenhousesDataSource.values.count
            case .size: return sizeDataSource.values.count
            }
        }

}

