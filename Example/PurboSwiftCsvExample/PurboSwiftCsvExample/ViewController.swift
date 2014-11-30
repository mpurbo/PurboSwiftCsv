//
//  ViewController.swift
//  PurboSwiftCsvExample
//
//  Created by Purbo Mohamad on 11/30/14.
//  Copyright (c) 2014 Purbo. All rights reserved.
//

import UIKit
import PurboSwiftCsv

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parser = Parser(fromUrl: NSBundle.mainBundle().URLForResource("test1", withExtension: "csv")!)
        parser!.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

