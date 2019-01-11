//
//  ViewController.swift
//  GyroscopeTest
//
//  Created by Aamina Munzir on 1/10/19.
//  Copyright © 2019 Aamina Munzir. All rights reserved.
//

import UIKit
import CoreMotion   //library for ~motion~

class ViewController: UIViewController {

    @IBOutlet weak var centerLabel: UILabel!
    
    var motionMang = CMMotionManager()  //manage all of gyro's info
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        motionMang.gyroUpdateInterval = 0.2
        motionMang.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                print(myData.rotationRate)
                if myData.rotationRate.x > 3 //|| myData.rotationRate.x < -3
                {
                    print("YOU TILTED YOUR SCREEN")
                    self.centerLabel.text = "Face"
                }
                else if myData.rotationRate.x < -3
                {
                    print("T I L T E D  U P")
                    self.centerLabel.text = "Ceiling"
                }
            }
        }
    }
    

}

