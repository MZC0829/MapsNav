//
//  ViewController.swift
//  MapsNav
//
//  Created by 麦志超 on 2017/11/21.
//  Copyright © 2017年 MZC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController
{
    /// 目的地坐标，113.946791,22.553355
    let toLocation = CLLocationCoordinate2D(latitude: 22.553355, longitude: 113.946791)

    @IBAction func navButtonTap(_ sender: UIButton)
    {
        mapsNav(toPoint: toLocation, toPointName: "good place")
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

