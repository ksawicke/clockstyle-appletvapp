//
//  ClockController.swift
//
//  Created by Kevin Sawicke on 5/11/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

class ClockController: UIViewController {

    var themes: Array = [0, 1, 2, 3]
    var themeData: [[String: String]] = [
        ["background": "color", "bgcolor": "black"],
        ["background": "color", "bgcolor": "green"],
        ["background": "color", "bgcolor": "red"],
        ["background": "color", "bgcolor": "orange"]
    ]
    var currentTheme : Int = 0
    
    var timeFormat: String = "America" // America, France, Burundi, Congo
    
    @IBOutlet weak var timeSlotBeg: UILabel!
    @IBOutlet weak var timeSlotH1: UILabel!
    @IBOutlet weak var timeSlotSep1: UILabel!
    @IBOutlet weak var timeSlotM1: UILabel!
    @IBOutlet weak var timeSlotSep2: UILabel!
    @IBOutlet weak var timeSlotS1: UILabel!
    @IBOutlet weak var timeSlotEnd: UILabel!
    @IBOutlet weak var dateSlot1: UILabel!
    @IBOutlet weak var dateSlot2: UILabel!
    @IBOutlet weak var dateSlot3: UILabel!
    @IBOutlet weak var dateSlot4: UILabel!
    
    @IBAction func onClickToggleTheme(_ sender: Any) {
        print("click")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClockController.updateClock), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateClock() {
        // https://www.appcoda.com/nsdate/
        // http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL_web
        
        let currentDate = NSDate()
        let dateFormatter = DateFormatter()
        // dateFormatter.locale = NSLocale.currentLocale()
        //        dateFormatter.locale = NSLocale(localeIdentifier: "el_GR")
        //        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR")
        
        // Full Style
        // dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        // var convertedDate = dateFormatter.stringFromDate(currentDate)
        // Monday, October 12, 2018
        
        // Medium Style
        // dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        // convertedDate = dateFormatter.stringFromDate(currentDate)
        
        // Short Style
        // dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        // convertedDate = dateFormatter.stringFromDate(currentDate)
        
        // dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        // convertedDate = dateFormatter.stringFromDate(currentDate)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        switch(timeFormat) {
            case "America":
                dateFormatter.dateFormat = "HH"
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "a"
                let timeEnding = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "EEE"
                let dayOfWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MMM"
                let shortMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "d"
                let dayDigits = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                timeSlotBeg.text = ""
                timeSlotH1.text = timeInHours
                timeSlotSep1.text = ":"
                timeSlotM1.text = timeInMinutes
                timeSlotSep2.text = ":"
                timeSlotS1.text = timeInSeconds
                timeSlotEnd.text = " \(timeEnding)"
            
                dateSlot1.text = "\(dayOfWeek)"
                dateSlot2.text = " \(shortMonth)"
                dateSlot3.text = " \(dayDigits), "
                dateSlot4.text = "\(thisYear)"
            
            case "France":
                timeSlotBeg.text = ""
                timeSlotH1.text = "2"
                timeSlotSep1.text = "h"
                timeSlotM1.text = "4"
                timeSlotEnd.text = ""
            
            case "Burundi":
                timeSlotBeg.text = "saa "
                timeSlotH1.text = "0"
                timeSlotSep1.text = ":"
                timeSlotM1.text = "4"
                timeSlotEnd.text = " za usiku"
            
            case "Congo":
                timeSlotBeg.text = ""
                timeSlotH1.text = "2"
                timeSlotSep1.text = ":"
                timeSlotM1.text = "4"
                timeSlotEnd.text = ""
            
            default:
                timeSlotBeg.text = ""
                timeSlotH1.text = "0"
                timeSlotSep1.text = ":"
                timeSlotM1.text = "4"
                timeSlotEnd.text = " pm"
        }
    }
    
}

