//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Nag Alluri on 10/12/15.
//  Copyright © 2015 Nag Alluri. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        completedLabel.text = String(tasksCompleted)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
            target: self,
            selector: Selector("tick"),
            userInfo: nil,
            repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        completedLabel.text = String(tasksCompleted)
    }
    
    @objc func tick() {
        timeLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(),
            dateStyle: .MediumStyle,
            timeStyle: .MediumStyle)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
