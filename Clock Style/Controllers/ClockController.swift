//
//  ClockController.swift
//
//  Created by Kevin Sawicke on 5/11/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

class ClockController: UIViewController {

    var themes: Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
    var themeData: [[String: String]] = [
        ["background": "color", "bgColor": "black", "fontColor": "darkGray"],
        ["background": "color", "bgColor": "green", "fontColor": "white"],
        ["background": "color", "bgColor": "red", "fontColor": "white"],
        ["background": "color", "bgColor": "orange", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-132197", "fontColor": "red"],
        ["background": "image", "bgImage": "pexels-photo-132205", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-139259", "fontColor": "white"],
        ["background": "image", "bgImage": "pexels-photo-163999", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-164005", "fontColor": "orange"],
        ["background": "image", "bgImage": "pexels-photo-168442", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-207142", "fontColor": "green"],
        ["background": "image", "bgImage": "pexels-photo-207253", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-245250", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-268976", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-296884", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-319382", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-850796", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-921776", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-953218", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-960137", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-985287", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-1022692", "fontColor": "darkGray"],
        ["background": "image", "bgImage": "pexels-photo-1101125", "fontColor": "darkGray"]
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
        if currentTheme == themes.count - 1 {
            currentTheme = 0
        } else {
            currentTheme += 1
        }
        
        updateTheme()
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
        // http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns
        
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
                dateFormatter.dateFormat = "hh"
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let firstMinuteDigit = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let secondMinuteDigit = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 2)
                print("firstMinuteDigit: \(firstMinuteDigit) .. secondMinuteDigit: \(secondMinuteDigit)")
                
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
    
    func updateTheme() {
        let themeSettings = themeData[currentTheme]
        
        if themeSettings["background"] == "color" {
            updateBgColor(bgColor: themeSettings["bgColor"]!)
        }
        
        if themeSettings["background"] == "image" {
            updateBgImage(bgImage: themeSettings["bgImage"]!)
        }
        
        updateFontColor(fontColor: themeSettings["fontColor"]!)
    }
    
    func getUIColor(color: String) -> UIColor {
        var outputUIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        
        switch(color) {
            case "green":
                outputUIColor = UIColor(red: 0/255.0, green: 143/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "red":
                outputUIColor = UIColor(red: 255/255.0, green: 38/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "orange":
                outputUIColor = UIColor(red: 255/255.0, green: 147/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "black":
                outputUIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "white":
                outputUIColor = UIColor(red: 255/255.0, green: 2555/255.0, blue: 255/255.0, alpha: 1.0)
            
            case "darkGray":
                outputUIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
            
            default:
                outputUIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        }
        
        return outputUIColor
    }
    
    func updateBgColor(bgColor: String) {
        view.backgroundColor = getUIColor(color: bgColor)
    }
    
    func updateBgImage(bgImage: String) {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "\(bgImage).png")!)
    }
    
    func updateFontColor(fontColor: String) {
        let newColor = getUIColor(color: fontColor)
        
        timeSlotBeg.textColor = newColor
        timeSlotH1.textColor = newColor
        timeSlotSep1.textColor = newColor
        timeSlotM1.textColor = newColor
        timeSlotSep2.textColor = newColor
        timeSlotS1.textColor = newColor
        timeSlotEnd.textColor = newColor
    }
    
}

