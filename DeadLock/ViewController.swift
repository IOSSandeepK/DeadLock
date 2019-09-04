//
//  ViewController.swift
//  DeadLock
//
//  Created by apple on 03/09/19.
//  Copyright © 2019 Swiftter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bike = ["biker1","biker2","biker3"]
    let road = ["road1","road2","road3"]
    let queue = DispatchQueue(label: "queue")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkDeadlock()
    }

    func checkDeadlock() {
        //1st task
        queue.async {
            self.bike.forEach { print($0)}
        
        
            self.queue.sync { // to solve deadlock need to change with async
            //2nd task
            //This will never happen
            self.road.forEach { print($0)}
            //outwr closure is wating for this inner closure to complete
            //This inner closure would not start before outer closure returns
            //Resulr:Deadlock
        }
        print("Done")
    }
    }

}

