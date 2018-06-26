//
//  ClockController.swift
//
//  Created by Kevin Sawicke on 5/11/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

class ClockController: UIViewController, UITabBarDelegate { //ChangeSettingsDelegate

    var themes: Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    var themeData: [[String: String]] = [
        ["background": "color", "bgColor": "black", "fontColor": "darkGray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        ["background": "color", "bgColor": "green", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        ["background": "color", "bgColor": "red", "fontColor": "yellow", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        ["background": "color", "bgColor": "orange", "fontColor": "darkGray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        ["background": "color", "bgColor": "black", "fontColor": "red", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonGreen", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonYellow", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonLightBlue", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonPurple", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonPink", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "white", "font": "custom", "fontName": "DS-Digital", "fontEffect": "none"],
        
        ["background": "color", "bgColor": "black", "fontColor": "red", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonGreen", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonYellow", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonLightBlue", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonPurple", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "neonPink", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        ["background": "color", "bgColor": "black", "fontColor": "white", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        
        ["background": "image", "bgImage": "pexels-photo-960137", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // red wood
        ["background": "image", "bgImage": "pexels-photo-268976", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // orange horiz wood
        ["background": "image", "bgImage": "pexels-photo-296884", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // dark brown wood
        ["background": "image", "bgImage": "pexels-photo-164005", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // nicer wood
        ["background": "image", "bgImage": "pexels-photo-319382", "fontColor": "darkGray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // yellow and orange
        ["background": "image", "bgImage": "pexels-photo-850796", "fontColor": "darkBlue", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // gray paper
        
        ["background": "image", "bgImage": "pexels-photo-132197", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // flagstone
        ["background": "image", "bgImage": "pexels-photo-921776", "fontColor": "darkGray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // gray marble
        ["background": "image", "bgImage": "pexels-photo-245250", "fontColor": "neonLightBlue", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"], // shiny gray tile
        ["background": "image", "bgImage": "pexels-photo-953218", "fontColor": "darkGray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"], // concrete
        ["background": "image", "bgImage": "pexels-photo-1022692", "fontColor": "neonYellow", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "none"], // brown brick
        ["background": "image", "bgImage": "pexels-photo-1101125", "fontColor": "white", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "none"] // red brick shadows
    ]
    var currentTheme : Int = 0
    
    var showTopBar : Bool = false
    
    var regions: Array = [0, 1, 2, 3, 4]
    var regionData: [[String: String]] = [
        ["regionName": "America", "description": "US"],
        ["regionName": "America24", "description": "US (24 HR)"],
        ["regionName": "France", "description": "France"],
        ["regionName": "Tanzania", "description": "Swahili"],
        ["regionName": "Congo", "description": "Swahili (Congo)"]
    ]
    var currentRegion : Int = 0
    var currentRegionDescription : String = ""
    var timeFormat: String = ""
    
//    var delegate : ChangeSettingsDelegate?
    
    @IBOutlet weak var timeSlotBeg: UILabel!
    @IBOutlet weak var timeSlotH1: UILabel!
    @IBOutlet weak var timeSlotH2: UILabel!
    @IBOutlet weak var timeSlotSep1: UILabel!
    @IBOutlet weak var timeSlotM1: UILabel!
    @IBOutlet weak var timeSlotM2: UILabel!
    @IBOutlet weak var timeSlotSep2: UILabel!
    @IBOutlet weak var timeSlotS1: UILabel!
    @IBOutlet weak var timeSlotS2: UILabel!
    @IBOutlet weak var timeSlotSep3: UILabel!
    @IBOutlet weak var timeSlotEnd: UILabel!
    @IBOutlet weak var dateSlot1: UILabel!
    @IBOutlet weak var dateSlot2: UILabel!
    @IBOutlet weak var dateSlot3: UILabel!
    @IBOutlet weak var dateSlot4: UILabel!
    @IBOutlet weak var timeZoneSlot: UILabel!
    @IBOutlet weak var currentRegionSelected: UILabel!
    @IBOutlet weak var selectSettingsBar: UITabBar!

    
    @IBAction func onClickToggleTheme(_ sender: Any) {
        if currentTheme == themes.count - 1 {
            currentTheme = 0
        } else {
            currentTheme += 1
        }
        
        updateTheme()
    }
    
    @IBAction func onClickToggleRegion(_ sender: Any) {
        if currentRegion == regions.count - 1 {
            currentRegion = 0
        } else {
            currentRegion += 1
        }
        
        updateClock()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectSettingsBar.delegate = self
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClockController.updateClock), userInfo: nil, repeats: true)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print(item.title!)

        guard let index = tabBar.items?.index(of: item) else { return }
            
        // Do something with the index
        print("\(item.title!) : \(index)")
        debugPrint(tabBar)
        
        let settingsVC = SettingsController()
        self.present(settingsVC, animated: true, completion: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .down && selectSettingsBar.isHidden == false) {
            disableTopBar()
        }
        
        if (sender.direction == .up && selectSettingsBar.isHidden == true) {
            enableTopBar()
        }
    }
    
    func disableTopBar() {
        selectSettingsBar.isHidden = true
        showTopBar = true
    }
    
    func enableTopBar() {
        selectSettingsBar.isHidden = false
        showTopBar = false
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
        
        timeFormat = regionData[currentRegion]["regionName"]!
        currentRegionDescription = regionData[currentRegion]["description"]!
        
        switch(timeFormat) {
            case "America", "America24":
                dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
                
                switch(timeFormat) {
                    case "America":
                        dateFormatter.dateFormat = "hh"
                    
                    case "America24":
                        dateFormatter.dateFormat = "HH"
                    
                    default:
                        dateFormatter.dateFormat = "hh"
                }
                
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                let hoursDigitIndex1 = timeInHours.index(timeInHours.startIndex, offsetBy: 0)
                let hoursDigitIndex2 = timeInHours.index(timeInHours.startIndex, offsetBy: 1)
                let timeHoursDigit1: String = "\(timeInHours[hoursDigitIndex1])"
                let timeHoursDigit2: String = "\(timeInHours[hoursDigitIndex2])"
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let minutesDigitIndex1 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 0)
                let minutesDigitIndex2 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let timeMinutesDigit1: String = "\(timeInMinutes[minutesDigitIndex1])"
                let timeMinutesDigit2: String = "\(timeInMinutes[minutesDigitIndex2])"

                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                let secondsDigitIndex1 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 0)
                let secondsDigitIndex2 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 1)
                let timeSecondsDigit1: String = "\(timeInSeconds[secondsDigitIndex1])"
                let timeSecondsDigit2: String = "\(timeInSeconds[secondsDigitIndex2])"
                
                dateFormatter.dateFormat = "a"
                var timeEnding = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "EEE"
                let thisDayofWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MMM"
                let thisMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "d"
                let thisDayNumber = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "zzz"
                let thisTimezone = dateFormatter.string(from: currentDate as Date)
                
                timeSlotBeg.text = ""
                timeSlotH1.text = timeHoursDigit1
                timeSlotH2.text = timeHoursDigit2
                timeSlotSep1.text = ":"
                timeSlotM1.text = timeMinutesDigit1
                timeSlotM2.text = timeMinutesDigit2
                timeSlotSep2.text = ":"
                timeSlotS1.text = timeSecondsDigit1
                timeSlotS2.text = timeSecondsDigit2
                timeSlotSep3.text = ""
                
                if(timeFormat == "America24") {
                    timeEnding = ""
                }
                
                timeSlotEnd.text = " \(timeEnding)"
            
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " \(thisMonth)"
                dateSlot3.text = " \(thisDayNumber), "
                dateSlot4.text = "\(thisYear)"
            
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
            
            case "France":
                dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale?
                
                dateFormatter.dateFormat = "HH"
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                let hoursDigitIndex1 = timeInHours.index(timeInHours.startIndex, offsetBy: 0)
                let hoursDigitIndex2 = timeInHours.index(timeInHours.startIndex, offsetBy: 1)
                let timeHoursDigit1: String = "\(timeInHours[hoursDigitIndex1])"
                let timeHoursDigit2: String = "\(timeInHours[hoursDigitIndex2])"
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let minutesDigitIndex1 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 0)
                let minutesDigitIndex2 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let timeMinutesDigit1: String = "\(timeInMinutes[minutesDigitIndex1])"
                let timeMinutesDigit2: String = "\(timeInMinutes[minutesDigitIndex2])"
                
                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                let secondsDigitIndex1 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 0)
                let secondsDigitIndex2 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 1)
                let timeSecondsDigit1: String = "\(timeInSeconds[secondsDigitIndex1])"
                let timeSecondsDigit2: String = "\(timeInSeconds[secondsDigitIndex2])"
                
                let timeEnding = ""
                
                dateFormatter.dateFormat = "EEEE"
                let thisDayofWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MMMM"
                let thisMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "d"
                let thisDayNumber = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "zzz"
                let thisTimezone = dateFormatter.string(from: currentDate as Date)
                
                timeSlotBeg.text = ""
                timeSlotH1.text = timeHoursDigit1
                timeSlotH2.text = timeHoursDigit2
                timeSlotSep1.text = " h "
                timeSlotM1.text = timeMinutesDigit1
                timeSlotM2.text = timeMinutesDigit2
                timeSlotSep2.text = " m "
                timeSlotS1.text = timeSecondsDigit1
                timeSlotS2.text = timeSecondsDigit2
                timeSlotSep3.text = " s"
                timeSlotEnd.text = " \(timeEnding)"
                
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " le \(thisDayNumber)"
                dateSlot3.text = " \(thisMonth) "
                dateSlot4.text = "\(thisYear)"
            
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
            
            case "Tanzania":
                dateFormatter.locale = NSLocale(localeIdentifier: "sw_TZ") as Locale?
                
                dateFormatter.dateFormat = "hh"
                var timeInHours = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "HH"
                let timeInHours24 = dateFormatter.string(from: currentDate as Date)
                
                switch(timeInHours) {
                    case "07":
                        timeInHours = "01"
                    
                    case "08":
                        timeInHours = "02"
                    
                    case "09":
                        timeInHours = "03"
                    
                    case "10":
                        timeInHours = "04"
                    
                    case "11":
                        timeInHours = "05"
                    
                    case "12":
                        timeInHours = "06"
                    
                    case "01":
                        timeInHours = "07"
                    
                    case "02":
                        timeInHours = "08"
                    
                    case "03":
                        timeInHours = "09"
                    
                    case "04":
                        timeInHours = "10"
                    
                    case "05":
                        timeInHours = "11"
                    
                    case "06":
                        timeInHours = "12"
                    
                    default:
                        timeInHours = "01"
                }
                
                let hoursDigitIndex1 = timeInHours.index(timeInHours.startIndex, offsetBy: 0)
                let hoursDigitIndex2 = timeInHours.index(timeInHours.startIndex, offsetBy: 1)
                let timeHoursDigit1: String = "\(timeInHours[hoursDigitIndex1])"
                let timeHoursDigit2: String = "\(timeInHours[hoursDigitIndex2])"
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let minutesDigitIndex1 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 0)
                let minutesDigitIndex2 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let timeMinutesDigit1: String = "\(timeInMinutes[minutesDigitIndex1])"
                let timeMinutesDigit2: String = "\(timeInMinutes[minutesDigitIndex2])"
                
                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                let secondsDigitIndex1 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 0)
                let secondsDigitIndex2 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 1)
                let timeSecondsDigit1: String = "\(timeInSeconds[secondsDigitIndex1])"
                let timeSecondsDigit2: String = "\(timeInSeconds[secondsDigitIndex2])"
                
                dateFormatter.dateFormat = "a"
                
                var timeEnding = ""
                
                switch(timeInHours24) {
                    case "05", "06", "07", "08", "09":
                        timeEnding = " za asubuhi"
                    
                    case "10", "11", "12", "13", "14", "15":
                        timeEnding = " za mchana"
                    
                    case "16", "17", "18":
                        timeEnding = " za jioni"
                    
                    case "19", "20", "21", "22", "23", "00", "01", "02", "03", "04":
                        timeEnding = " za usiku"
                    
                    default:
                        timeEnding = " za asubuhi"
                }
                
                dateFormatter.dateFormat = "EEE"
                let thisDayofWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MMMM"
                let thisMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "d"
                let thisDayNumber = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "zzz"
                let thisTimezone = dateFormatter.string(from: currentDate as Date)
                
                timeSlotBeg.text = "saa "
                timeSlotH1.text = timeHoursDigit1
                timeSlotH2.text = timeHoursDigit2
                timeSlotSep1.text = ":"
                timeSlotM1.text = timeMinutesDigit1
                timeSlotM2.text = timeMinutesDigit2
                timeSlotSep2.text = ":"
                timeSlotS1.text = timeSecondsDigit1
                timeSlotS2.text = timeSecondsDigit2
                timeSlotSep3.text = ""
                timeSlotEnd.text = " \(timeEnding)"
                
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " \(thisMonth)"
                dateSlot3.text = " \(thisDayNumber), "
                dateSlot4.text = "\(thisYear)"
            
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
            
            case "Congo":
                dateFormatter.locale = NSLocale(localeIdentifier: "swc_CD") as Locale?
                
                dateFormatter.dateFormat = "HH"
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                let hoursDigitIndex1 = timeInHours.index(timeInHours.startIndex, offsetBy: 0)
                let hoursDigitIndex2 = timeInHours.index(timeInHours.startIndex, offsetBy: 1)
                let timeHoursDigit1: String = "\(timeInHours[hoursDigitIndex1])"
                let timeHoursDigit2: String = "\(timeInHours[hoursDigitIndex2])"
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let minutesDigitIndex1 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 0)
                let minutesDigitIndex2 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let timeMinutesDigit1: String = "\(timeInMinutes[minutesDigitIndex1])"
                let timeMinutesDigit2: String = "\(timeInMinutes[minutesDigitIndex2])"
                
                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                let secondsDigitIndex1 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 0)
                let secondsDigitIndex2 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 1)
                let timeSecondsDigit1: String = "\(timeInSeconds[secondsDigitIndex1])"
                let timeSecondsDigit2: String = "\(timeInSeconds[secondsDigitIndex2])"
                var timeEnding = ""
                
                switch(timeInHours) {
                    case "05", "06", "07", "08", "09":
                        timeEnding = " za asubuhi"
                    
                    case "10", "11", "12", "13", "14", "15":
                        timeEnding = " za mchana"
                    
                    case "16", "17", "18":
                        timeEnding = " za jioni"
                    
                    case "19", "20", "21", "22", "23", "00", "01", "02", "03", "04":
                        timeEnding = " za usiku"
                    
                    default:
                        timeEnding = " za asubuhi"
                }
                
                dateFormatter.dateFormat = "EEEE"
                var thisDayofWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MM"
                let thisMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "dd"
                let thisDayNumber = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "zzz"
                let thisTimezone = dateFormatter.string(from: currentDate as Date)
                
                switch(thisDayofWeek) {
                    case "Sunday":
                        thisDayofWeek = "Siku ya Yenga"
                    
                    case "Monday":
                        thisDayofWeek = "Siku ya Kwanza"
                    
                    case "Tuesday":
                        thisDayofWeek = "Siku ya Pili"
                    
                    case "Wednesday":
                        thisDayofWeek = "Siku ya Tatu"
                    
                    case "Thursday":
                        thisDayofWeek = "Siku ya Ine"
                    
                    case "Friday":
                        thisDayofWeek = "Siku ya Tano"
                    
                    case "Saturday":
                        thisDayofWeek = "Siku ya Posho"
                    
                    default:
                        thisDayofWeek = "Siku ya Kwanza"
                }
                
                timeSlotBeg.text = "saa "
                timeSlotH1.text = timeHoursDigit1
                timeSlotH2.text = timeHoursDigit2
                timeSlotSep1.text = ":"
                timeSlotM1.text = timeMinutesDigit1
                timeSlotM2.text = timeMinutesDigit2
                timeSlotSep2.text = ":"
                timeSlotS1.text = timeSecondsDigit1
                timeSlotS2.text = timeSecondsDigit2
                timeSlotSep3.text = ""
                timeSlotEnd.text = " \(timeEnding)"
                
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " \(thisDayNumber)"
                dateSlot3.text = "/\(thisMonth)"
                dateSlot4.text = "/\(thisYear)"
            
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
            
            default:
                dateFormatter.dateFormat = "hh"
                let timeInHours = dateFormatter.string(from: currentDate as Date)
                let hoursDigitIndex1 = timeInHours.index(timeInHours.startIndex, offsetBy: 0)
                let hoursDigitIndex2 = timeInHours.index(timeInHours.startIndex, offsetBy: 1)
                let timeHoursDigit1: String = "\(timeInHours[hoursDigitIndex1])"
                let timeHoursDigit2: String = "\(timeInHours[hoursDigitIndex2])"
                
                dateFormatter.dateFormat = "mm"
                let timeInMinutes = dateFormatter.string(from: currentDate as Date)
                let minutesDigitIndex1 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 0)
                let minutesDigitIndex2 = timeInMinutes.index(timeInMinutes.startIndex, offsetBy: 1)
                let timeMinutesDigit1: String = "\(timeInMinutes[minutesDigitIndex1])"
                let timeMinutesDigit2: String = "\(timeInMinutes[minutesDigitIndex2])"
                
                dateFormatter.dateFormat = "ss"
                let timeInSeconds = dateFormatter.string(from: currentDate as Date)
                let secondsDigitIndex1 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 0)
                let secondsDigitIndex2 = timeInSeconds.index(timeInSeconds.startIndex, offsetBy: 1)
                let timeSecondsDigit1: String = "\(timeInSeconds[secondsDigitIndex1])"
                let timeSecondsDigit2: String = "\(timeInSeconds[secondsDigitIndex2])"
                
                dateFormatter.dateFormat = "a"
                let timeEnding = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "EEE"
                let thisDayofWeek = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "MMM"
                let thisMonth = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "d"
                let thisDayNumber = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "yyyy"
                let thisYear = dateFormatter.string(from: currentDate as Date)
                
                dateFormatter.dateFormat = "zzz"
                let thisTimezone = dateFormatter.string(from: currentDate as Date)
                
                timeSlotBeg.text = ""
                timeSlotH1.text = timeHoursDigit1
                timeSlotH2.text = timeHoursDigit2
                timeSlotSep1.text = ":"
                timeSlotM1.text = timeMinutesDigit1
                timeSlotM2.text = timeMinutesDigit2
                timeSlotSep2.text = ":"
                timeSlotS1.text = timeSecondsDigit1
                timeSlotS2.text = timeSecondsDigit2
                timeSlotSep3.text = ""
                timeSlotEnd.text = " \(timeEnding)"
                
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " \(thisMonth)"
                dateSlot3.text = " \(thisDayNumber), "
                dateSlot4.text = "\(thisYear)"
                
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
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
        
        if themeSettings["font"] == "custom" {
            updateFont(font: themeSettings["fontName"]!)
        }
        
        if themeSettings["fontEffect"] == "glow" {
            makeFontGlow(fontColor: themeSettings["fontColor"]!)
        } else {
            makeFontNoGlow(fontColor: themeSettings["fontColor"]!)
        }
        
        updateFontColor(fontColor: themeSettings["fontColor"]!)
    }
    
    func getUIColor(color: String) -> UIColor {
        var outputUIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        
        switch(color) {
            case "neonYellow":
                outputUIColor = UIColor(red: 254/255.0, green: 228/255.0, blue: 2/255.0, alpha: 1.0)
            
            case "neonPink":
                outputUIColor = UIColor(red: 255/255.0, green: 64/255.0, blue: 255/255.0, alpha: 1.0)
            
            case "neonGreen":
                outputUIColor = UIColor(red: 105/255.0, green: 245/255.0, blue: 18/255.0, alpha: 1.0)
            
            case "neonPurple":
                outputUIColor = UIColor(red: 189/255.0, green: 109/255.0, blue: 246/255.0, alpha: 1.0)
            
            case "neonLightBlue":
                outputUIColor = UIColor(red: 125/255.0, green: 232/255.0, blue: 246/255.0, alpha: 1.0)
            
            case "bubbleGum":
                outputUIColor = UIColor(red: 255/255.0, green: 47/255.0, blue: 146/255.0, alpha: 1.0)
            
            case "green":
                outputUIColor = UIColor(red: 0/255.0, green: 143/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "red":
                outputUIColor = UIColor(red: 255/255.0, green: 38/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "orange":
                outputUIColor = UIColor(red: 255/255.0, green: 147/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "yellow":
                outputUIColor = UIColor(red: 255/255.0, green: 251/255.0, blue: 0/255.0, alpha: 1.0)
            
            case "darkBlue":
                outputUIColor = UIColor(red: 1/255.0, green: 25/255.0, blue: 147/255.0, alpha: 1.0)
            
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
        timeSlotH2.textColor = newColor
        timeSlotSep1.textColor = newColor
        timeSlotM1.textColor = newColor
        timeSlotM2.textColor = newColor
        timeSlotSep2.textColor = newColor
        timeSlotS1.textColor = newColor
        timeSlotS2.textColor = newColor
        timeSlotSep3.textColor = newColor
        timeSlotEnd.textColor = newColor
        
        dateSlot1.textColor = newColor
        dateSlot2.textColor = newColor
        dateSlot3.textColor = newColor
        dateSlot4.textColor = newColor
        
        timeZoneSlot.textColor = newColor
    }
    
    func updateFont(font: String) {
        let newFont = UIFont(name: font, size: 135)
        let newFontMed = UIFont(name: font, size: 85)
        let newFontSm = UIFont(name: font, size: 50)
        
        timeSlotBeg.font = newFontSm
        
        timeSlotH1.font = newFont
        timeSlotH2.font = newFont
        timeSlotSep1.font = newFont
        timeSlotM1.font = newFont
        timeSlotM2.font = newFont
        timeSlotSep2.font = newFont
        timeSlotS1.font = newFont
        timeSlotS2.font = newFont
        timeSlotSep3.font = newFont
        
        timeSlotEnd.font = newFontSm
        
        dateSlot1.font = newFontMed
        dateSlot2.font = newFontMed
        dateSlot3.font = newFontMed
        dateSlot4.font = newFontMed
        
        timeZoneSlot.font = newFontMed
    }
    
    func makeFontNoGlow(fontColor: String) {
        let newColor = getUIColor(color: fontColor)
        
        timeSlotH1.layer.shadowColor = newColor.cgColor
        timeSlotH1.layer.shadowOffset = .zero
        timeSlotH1.layer.shadowRadius = 0.0
        timeSlotH1.layer.shadowOpacity = 0.0
        timeSlotH1.layer.masksToBounds = false
        timeSlotH1.layer.shouldRasterize = false
        
        timeSlotH2.layer.shadowColor = newColor.cgColor
        timeSlotH2.layer.shadowOffset = .zero
        timeSlotH2.layer.shadowRadius = 0.0
        timeSlotH2.layer.shadowOpacity = 0.0
        timeSlotH2.layer.masksToBounds = false
        timeSlotH2.layer.shouldRasterize = false
        
        timeSlotSep1.layer.shadowColor = newColor.cgColor
        timeSlotSep1.layer.shadowOffset = .zero
        timeSlotSep1.layer.shadowRadius = 0.0
        timeSlotSep1.layer.shadowOpacity = 0.0
        timeSlotSep1.layer.masksToBounds = false
        timeSlotSep1.layer.shouldRasterize = false
        
        timeSlotM1.layer.shadowColor = newColor.cgColor
        timeSlotM1.layer.shadowOffset = .zero
        timeSlotM1.layer.shadowRadius = 0.0
        timeSlotM1.layer.shadowOpacity = 0.0
        timeSlotM1.layer.masksToBounds = false
        timeSlotM1.layer.shouldRasterize = false
        
        timeSlotM2.layer.shadowColor = newColor.cgColor
        timeSlotM2.layer.shadowOffset = .zero
        timeSlotM2.layer.shadowRadius = 0.0
        timeSlotM2.layer.shadowOpacity = 0.0
        timeSlotM2.layer.masksToBounds = false
        timeSlotM2.layer.shouldRasterize = false
        
        timeSlotSep2.layer.shadowColor = newColor.cgColor
        timeSlotSep2.layer.shadowOffset = .zero
        timeSlotSep2.layer.shadowRadius = 0.0
        timeSlotSep2.layer.shadowOpacity = 0.0
        timeSlotSep2.layer.masksToBounds = false
        timeSlotSep2.layer.shouldRasterize = false
        
        timeSlotS1.layer.shadowColor = newColor.cgColor
        timeSlotS1.layer.shadowOffset = .zero
        timeSlotS1.layer.shadowRadius = 0.0
        timeSlotS1.layer.shadowOpacity = 0.0
        timeSlotS1.layer.masksToBounds = false
        timeSlotS1.layer.shouldRasterize = false
        
        timeSlotS2.layer.shadowColor = newColor.cgColor
        timeSlotS2.layer.shadowOffset = .zero
        timeSlotS2.layer.shadowRadius = 0.0
        timeSlotS2.layer.shadowOpacity = 0.0
        timeSlotS2.layer.masksToBounds = false
        timeSlotS2.layer.shouldRasterize = false
        
        timeSlotSep3.layer.shadowColor = newColor.cgColor
        timeSlotSep3.layer.shadowOffset = .zero
        timeSlotSep3.layer.shadowRadius = 0.0
        timeSlotSep3.layer.shadowOpacity = 0.0
        timeSlotSep3.layer.masksToBounds = false
        timeSlotSep3.layer.shouldRasterize = false
        
        timeSlotEnd.layer.shadowColor = newColor.cgColor
        timeSlotEnd.layer.shadowOffset = .zero
        timeSlotEnd.layer.shadowRadius = 0.0
        timeSlotEnd.layer.shadowOpacity = 0.0
        timeSlotEnd.layer.masksToBounds = false
        timeSlotEnd.layer.shouldRasterize = false
        
        dateSlot1.layer.shadowColor = newColor.cgColor
        dateSlot1.layer.shadowOffset = .zero
        dateSlot1.layer.shadowRadius = 0.0
        dateSlot1.layer.shadowOpacity = 0.0
        dateSlot1.layer.masksToBounds = false
        dateSlot1.layer.shouldRasterize = false
        
        dateSlot2.layer.shadowColor = newColor.cgColor
        dateSlot2.layer.shadowOffset = .zero
        dateSlot2.layer.shadowRadius = 0.0
        dateSlot2.layer.shadowOpacity = 0.0
        dateSlot2.layer.masksToBounds = false
        dateSlot2.layer.shouldRasterize = false
        
        dateSlot3.layer.shadowColor = newColor.cgColor
        dateSlot3.layer.shadowOffset = .zero
        dateSlot3.layer.shadowRadius = 0.0
        dateSlot3.layer.shadowOpacity = 0.0
        dateSlot3.layer.masksToBounds = false
        dateSlot3.layer.shouldRasterize = false
        
        dateSlot4.layer.shadowColor = newColor.cgColor
        dateSlot4.layer.shadowOffset = .zero
        dateSlot4.layer.shadowRadius = 0.0
        dateSlot4.layer.shadowOpacity = 0.0
        dateSlot4.layer.masksToBounds = false
        dateSlot4.layer.shouldRasterize = true
        
        timeZoneSlot.layer.shadowColor = newColor.cgColor
        timeZoneSlot.layer.shadowOffset = .zero
        timeZoneSlot.layer.shadowRadius = 0.0
        timeZoneSlot.layer.shadowOpacity = 0.0
        timeZoneSlot.layer.masksToBounds = false
        timeZoneSlot.layer.shouldRasterize = false
    }
    
    func makeFontGlow(fontColor: String) {
        let newColor = getUIColor(color: fontColor)
        
        timeSlotH1.layer.shadowColor = newColor.cgColor
        timeSlotH1.layer.shadowOffset = .zero
        timeSlotH1.layer.shadowRadius = 25.0
        timeSlotH1.layer.shadowOpacity = 0.9
        timeSlotH1.layer.masksToBounds = false
        timeSlotH1.layer.shouldRasterize = true
        
        timeSlotH2.layer.shadowColor = newColor.cgColor
        timeSlotH2.layer.shadowOffset = .zero
        timeSlotH2.layer.shadowRadius = 25.0
        timeSlotH2.layer.shadowOpacity = 0.9
        timeSlotH2.layer.masksToBounds = false
        timeSlotH2.layer.shouldRasterize = true
        
        timeSlotSep1.layer.shadowColor = newColor.cgColor
        timeSlotSep1.layer.shadowOffset = .zero
        timeSlotSep1.layer.shadowRadius = 25.0
        timeSlotSep1.layer.shadowOpacity = 0.9
        timeSlotSep1.layer.masksToBounds = false
        timeSlotSep1.layer.shouldRasterize = true
        
        timeSlotM1.layer.shadowColor = newColor.cgColor
        timeSlotM1.layer.shadowOffset = .zero
        timeSlotM1.layer.shadowRadius = 25.0
        timeSlotM1.layer.shadowOpacity = 0.9
        timeSlotM1.layer.masksToBounds = false
        timeSlotM1.layer.shouldRasterize = true
        
        timeSlotM2.layer.shadowColor = newColor.cgColor
        timeSlotM2.layer.shadowOffset = .zero
        timeSlotM2.layer.shadowRadius = 25.0
        timeSlotM2.layer.shadowOpacity = 0.9
        timeSlotM2.layer.masksToBounds = false
        timeSlotM2.layer.shouldRasterize = true
        
        timeSlotSep2.layer.shadowColor = newColor.cgColor
        timeSlotSep2.layer.shadowOffset = .zero
        timeSlotSep2.layer.shadowRadius = 25.0
        timeSlotSep2.layer.shadowOpacity = 0.9
        timeSlotSep2.layer.masksToBounds = false
        timeSlotSep2.layer.shouldRasterize = true
        
        timeSlotS1.layer.shadowColor = newColor.cgColor
        timeSlotS1.layer.shadowOffset = .zero
        timeSlotS1.layer.shadowRadius = 25.0
        timeSlotS1.layer.shadowOpacity = 0.9
        timeSlotS1.layer.masksToBounds = false
        timeSlotS1.layer.shouldRasterize = true
        
        timeSlotS2.layer.shadowColor = newColor.cgColor
        timeSlotS2.layer.shadowOffset = .zero
        timeSlotS2.layer.shadowRadius = 25.0
        timeSlotS2.layer.shadowOpacity = 0.9
        timeSlotS2.layer.masksToBounds = false
        timeSlotS2.layer.shouldRasterize = true
        
        timeSlotSep3.layer.shadowColor = newColor.cgColor
        timeSlotSep3.layer.shadowOffset = .zero
        timeSlotSep3.layer.shadowRadius = 25.0
        timeSlotSep3.layer.shadowOpacity = 0.9
        timeSlotSep3.layer.masksToBounds = false
        timeSlotSep3.layer.shouldRasterize = true
        
        timeSlotEnd.layer.shadowColor = newColor.cgColor
        timeSlotEnd.layer.shadowOffset = .zero
        timeSlotEnd.layer.shadowRadius = 25.0
        timeSlotEnd.layer.shadowOpacity = 0.9
        timeSlotEnd.layer.masksToBounds = false
        timeSlotEnd.layer.shouldRasterize = true
        
        dateSlot1.layer.shadowColor = newColor.cgColor
        dateSlot1.layer.shadowOffset = .zero
        dateSlot1.layer.shadowRadius = 25.0
        dateSlot1.layer.shadowOpacity = 0.9
        dateSlot1.layer.masksToBounds = false
        dateSlot1.layer.shouldRasterize = true
        
        dateSlot2.layer.shadowColor = newColor.cgColor
        dateSlot2.layer.shadowOffset = .zero
        dateSlot2.layer.shadowRadius = 25.0
        dateSlot2.layer.shadowOpacity = 0.9
        dateSlot2.layer.masksToBounds = false
        dateSlot2.layer.shouldRasterize = true
        
        dateSlot3.layer.shadowColor = newColor.cgColor
        dateSlot3.layer.shadowOffset = .zero
        dateSlot3.layer.shadowRadius = 25.0
        dateSlot3.layer.shadowOpacity = 0.9
        dateSlot3.layer.masksToBounds = false
        dateSlot3.layer.shouldRasterize = true
        
        dateSlot4.layer.shadowColor = newColor.cgColor
        dateSlot4.layer.shadowOffset = .zero
        dateSlot4.layer.shadowRadius = 25.0
        dateSlot4.layer.shadowOpacity = 0.9
        dateSlot4.layer.masksToBounds = false
        dateSlot4.layer.shouldRasterize = true
        
        timeZoneSlot.layer.shadowColor = newColor.cgColor
        timeZoneSlot.layer.shadowOffset = .zero
        timeZoneSlot.layer.shadowRadius = 25.0
        timeZoneSlot.layer.shadowOpacity = 0.9
        timeZoneSlot.layer.masksToBounds = false
        timeZoneSlot.layer.shouldRasterize = true
    }
    
    func userChangedSettings(bgColor: String) {
        print("TEST: \(bgColor)")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        print(segue.identifier!)
//
//        switch(segue.identifier!) {
//        case "settingsVC":
//            let destinationVC = segue.destination as! SettingsController
//
//            destinationVC.delegate = self as! ChangeSettingsDelegate
//            destinationVC.bgColor = "BLUE RASPBERRY" //self.barCodeScanned
//            
//            print("OKOK")
//
//        default:
//            print("ERROR")
//        }
//    }
    
}

