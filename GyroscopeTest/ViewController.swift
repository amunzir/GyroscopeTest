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

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
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
                if myData.rotationRate.x > 2 //|| myData.rotationRate.x < -3
                {
                    //print("YOU TILTED YOUR SCREEN")
                    self.xLabel.text = "X-Axis: Forward"
                }
                else if myData.rotationRate.x < -2
                {
                    //print("T I L T E D  U P")
                    self.xLabel.text = "X-Axis: Backward"
                }
                
                if myData.rotationRate.y > 2
                {
                    //print("YOU TILTED YOUR SCREEN")
                    self.yLabel.text = "Y-Axis: Right"
                }
                else if myData.rotationRate.y < -2
                {
                    //print("T I L T E D  U P")
                    self.yLabel.text = "Y-Axis: Left"
                }
                
                if myData.rotationRate.z > 2
                {
                    //print("YOU TILTED YOUR SCREEN")
                    self.zLabel.text = "Z-Axis: Counter Clockwise"
                }
                else if myData.rotationRate.z < -2
                {
                    //print("T I L T E D  U P")
                    self.zLabel.text = "Z-Axis: Clockwise"
                }
            }
        }
    }
    

}

