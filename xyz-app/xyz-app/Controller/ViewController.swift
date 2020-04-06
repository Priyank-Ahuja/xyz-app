//
//  ViewController.swift
//  xyz-app
//
//  Created by Pravir Ahuja on 06/04/20.
//  Copyright © 2020 Priyank Ahuja. All rights reserved.
//
import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager: CMMotionManager!
    
    @IBOutlet weak var XLabel: UILabel!
    @IBOutlet weak var YLabel: UILabel!
    @IBOutlet weak var ZLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else {return}
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        XLabel.text = "Xhello: \(x)"
        YLabel.text = "Y: \(y)"
        ZLabel.text = "Z \(z)"
        
    }


}

