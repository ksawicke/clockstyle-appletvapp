//
//  ClockController.swift
//
//  Created by Kevin Sawicke on 5/11/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit
import JGProgressHUD

class ClockController: UIViewController, ChangeStyleDelegate, ChangeLanguageDelegate, UITabBarDelegate {
    
    var themeInfo: [String:[String:String]] = [
        // Wood
        "11": ["background": "image", "bgImage": "1", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "12": ["background": "image", "bgImage": "2", "fontColor": "black", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "13": ["background": "image", "bgImage": "3", "fontColor": "gray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "14": ["background": "image", "bgImage": "4", "fontColor": "darkBlue", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "15": ["background": "image", "bgImage": "5", "fontColor": "black", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "16": ["background": "image", "bgImage": "6", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "17": ["background": "image", "bgImage": "7", "fontColor": "black", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "18": ["background": "image", "bgImage": "8", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "19": ["background": "image", "bgImage": "9", "fontColor": "bubbleGum", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Stone
        "21": ["background": "image", "bgImage": "10", "fontColor": "neonGreen", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "22": ["background": "image", "bgImage": "11", "fontColor": "neonYellow", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "23": ["background": "image", "bgImage": "12", "fontColor": "neonLightBlue", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "24": ["background": "image", "bgImage": "13", "fontColor": "neonGreen", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "25": ["background": "image", "bgImage": "14", "fontColor": "orange", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "26": ["background": "image", "bgImage": "15", "fontColor": "neonPurple", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "27": ["background": "image", "bgImage": "16", "fontColor": "red", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "28": ["background": "image", "bgImage": "17", "fontColor": "neonYellow", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "29": ["background": "image", "bgImage": "18", "fontColor": "neonGreen", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        
        // Night
        "31": ["background": "image", "bgImage": "19", "fontColor": "red", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "32": ["background": "image", "bgImage": "20", "fontColor": "neonLightBlue", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        "33": ["background": "image", "bgImage": "21", "fontColor": "neonLightBlue", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        "34": ["background": "image", "bgImage": "22", "fontColor": "neonGreen", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "35": ["background": "image", "bgImage": "23", "fontColor": "neonPurple", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "36": ["background": "image", "bgImage": "24", "fontColor": "neonPurple", "font": "custom", "fontName": "DS-Digital", "fontEffect": "none"],
        "37": ["background": "image", "bgImage": "25", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "38": ["background": "image", "bgImage": "26", "fontColor": "orange", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "39": ["background": "image", "bgImage": "27", "fontColor": "neonYellow", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        
        // Blues
        "41": ["background": "image", "bgImage": "28", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "42": ["background": "image", "bgImage": "29", "fontColor": "neonLightBlue", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "43": ["background": "image", "bgImage": "30", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "44": ["background": "image", "bgImage": "31", "fontColor": "neonGreen", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "45": ["background": "image", "bgImage": "32", "fontColor": "neonYellow", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "46": ["background": "image", "bgImage": "33", "fontColor": "gray", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "47": ["background": "image", "bgImage": "34", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "48": ["background": "image", "bgImage": "35", "fontColor": "neonYellow", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "49": ["background": "image", "bgImage": "36", "fontColor": "bubbleGum", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        
        // Warmth
        "51": ["background": "image", "bgImage": "37", "fontColor": "black", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "52": ["background": "image", "bgImage": "38", "fontColor": "white", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "53": ["background": "image", "bgImage": "39", "fontColor": "gray", "font": "custom", "fontName": "DS-Digital", "fontEffect": "none"],
        "54": ["background": "image", "bgImage": "40", "fontColor": "gray", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "55": ["background": "image", "bgImage": "41", "fontColor": "black", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "56": ["background": "image", "bgImage": "42", "fontColor": "gray", "font": "custom", "fontName": "Neon Tubes 2", "fontEffect": "glow"],
        "57": ["background": "image", "bgImage": "43", "fontColor": "gray", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "58": ["background": "image", "bgImage": "44", "fontColor": "bubbleGum", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "59": ["background": "image", "bgImage": "45", "fontColor": "gray", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Coffee
        "61": ["background": "image", "bgImage": "46", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "62": ["background": "image", "bgImage": "47", "fontColor": "neonLightBlue", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "63": ["background": "image", "bgImage": "48", "fontColor": "neonYellow", "font": "custom", "fontName": "DS-Digital", "fontEffect": "glow"],
        "64": ["background": "image", "bgImage": "49", "fontColor": "orange", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "65": ["background": "image", "bgImage": "50", "fontColor": "white", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "66": ["background": "image", "bgImage": "51", "fontColor": "black", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "67": ["background": "image", "bgImage": "52", "fontColor": "white", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        "68": ["background": "image", "bgImage": "53", "fontColor": "orange", "font": "custom", "fontName": "lcddot", "fontEffect": "glow"],
        "69": ["background": "image", "bgImage": "54", "fontColor": "black", "font": "custom", "fontName": "lcddot", "fontEffect": "none"],
        
        // In-App Purchases
        // Theme Pack - Bridges (clockstyle.themepack1)
        "71": ["background": "image", "bgImage": "55", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "72": ["background": "image", "bgImage": "56", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "73": ["background": "image", "bgImage": "57", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "74": ["background": "image", "bgImage": "58", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "75": ["background": "image", "bgImage": "59", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "76": ["background": "image", "bgImage": "60", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "77": ["background": "image", "bgImage": "61", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "78": ["background": "image", "bgImage": "62", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "79": ["background": "image", "bgImage": "63", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],

        // Theme Pack - Bulbs (clockstyle.themepack2)
        "81": ["background": "image", "bgImage": "64", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "82": ["background": "image", "bgImage": "65", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "83": ["background": "image", "bgImage": "66", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "84": ["background": "image", "bgImage": "67", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "85": ["background": "image", "bgImage": "68", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "86": ["background": "image", "bgImage": "69", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "87": ["background": "image", "bgImage": "70", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "88": ["background": "image", "bgImage": "71", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "89": ["background": "image", "bgImage": "72", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
    
        // Theme Pack - Classic Audio (clockstyle.themepack7)
        "91": ["background": "image", "bgImage": "73", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "92": ["background": "image", "bgImage": "74", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "93": ["background": "image", "bgImage": "75", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "94": ["background": "image", "bgImage": "76", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "95": ["background": "image", "bgImage": "77", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "96": ["background": "image", "bgImage": "78", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "97": ["background": "image", "bgImage": "79", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "98": ["background": "image", "bgImage": "80", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "99": ["background": "image", "bgImage": "81", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
    
        // Theme Pack - Classic Cameras (clockstyle.themepack8)
        "101": ["background": "image", "bgImage": "82", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "102": ["background": "image", "bgImage": "83", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "103": ["background": "image", "bgImage": "84", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "104": ["background": "image", "bgImage": "85", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "105": ["background": "image", "bgImage": "86", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "106": ["background": "image", "bgImage": "87", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "107": ["background": "image", "bgImage": "88", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "108": ["background": "image", "bgImage": "89", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "109": ["background": "image", "bgImage": "90", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Theme Pack - Classic Cars (clockstyle.themepack3)
        "111": ["background": "image", "bgImage": "91", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "112": ["background": "image", "bgImage": "92", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "113": ["background": "image", "bgImage": "93", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "114": ["background": "image", "bgImage": "94", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "115": ["background": "image", "bgImage": "95", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "116": ["background": "image", "bgImage": "96", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "117": ["background": "image", "bgImage": "97", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "118": ["background": "image", "bgImage": "98", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "119": ["background": "image", "bgImage": "99", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Theme Pack - Classic Games (clockstyle.themepack9)
        "121": ["background": "image", "bgImage": "100", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "122": ["background": "image", "bgImage": "101", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "123": ["background": "image", "bgImage": "102", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "124": ["background": "image", "bgImage": "103", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "125": ["background": "image", "bgImage": "104", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "126": ["background": "image", "bgImage": "105", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "127": ["background": "image", "bgImage": "106", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "128": ["background": "image", "bgImage": "107", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "129": ["background": "image", "bgImage": "108", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Theme Pack - Desert (clockstyle.themepack4)
        "131": ["background": "image", "bgImage": "109", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "132": ["background": "image", "bgImage": "110", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "133": ["background": "image", "bgImage": "111", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "134": ["background": "image", "bgImage": "112", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "135": ["background": "image", "bgImage": "113", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "136": ["background": "image", "bgImage": "114", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "137": ["background": "image", "bgImage": "115", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "138": ["background": "image", "bgImage": "116", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "139": ["background": "image", "bgImage": "117", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Theme Pack - Maps (clockstyle.themepack5)
        "141": ["background": "image", "bgImage": "118", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "142": ["background": "image", "bgImage": "119", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "143": ["background": "image", "bgImage": "120", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "144": ["background": "image", "bgImage": "121", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "145": ["background": "image", "bgImage": "122", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "146": ["background": "image", "bgImage": "123", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "147": ["background": "image", "bgImage": "124", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "148": ["background": "image", "bgImage": "125", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "149": ["background": "image", "bgImage": "126", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        
        // Theme Pack - Palms (clockstyle.themepack6)
        "151": ["background": "image", "bgImage": "127", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "152": ["background": "image", "bgImage": "128", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "153": ["background": "image", "bgImage": "129", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "154": ["background": "image", "bgImage": "130", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "155": ["background": "image", "bgImage": "131", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "156": ["background": "image", "bgImage": "132", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "157": ["background": "image", "bgImage": "133", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "158": ["background": "image", "bgImage": "134", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
        "159": ["background": "image", "bgImage": "135", "fontColor": "white", "font": "custom", "fontName": "Orbitron-Bold", "fontEffect": "none"],
    ]
    var currentTheme : String = ""
    
    var showTopBar : Bool = false
    
    var regionData: [[String: String]] = [
        ["regionName": "English12", "description": "English (12 HR)"],
        ["regionName": "English24", "description": "English (24 HR)"],
        ["regionName": "Spanish", "description": "Spanish"],
        ["regionName": "French", "description": "French"],
        ["regionName": "Swahili", "description": "Swahili"],
        ["regionName": "SwahiliCongo", "description": "Swahili (Congo)"]
    ]
    var currentRegion : Int = 0
    var currentRegionDescription : String = ""
    var timeFormat: String = ""
    var hoveredItem: String = ""
    
    var selectedRowNumber: Int = 4
    var selectedCellNumber: Int = 1
    
    var styleDelegate : ChangeStyleDelegate?
    var languageDelegate : ChangeLanguageDelegate?
    
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
    @IBOutlet weak var attributionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideHUD()
        
        selectSettingsBar.delegate = self
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClockController.updateClock), userInfo: nil, repeats: true)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
        
        let mainbuttonPressRecognizer = UITapGestureRecognizer()
        mainbuttonPressRecognizer.addTarget(self, action: #selector(self.mainButtonAction))
        mainbuttonPressRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.select.rawValue)]
        self.view.addGestureRecognizer(mainbuttonPressRecognizer)
        
        currentTheme = "\(selectedRowNumber)\(selectedCellNumber)"
        
        updateTheme()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard (tabBar.items?.index(of: item)) != nil else { return }
        hoveredItem = item.title!
    }
    
    @objc func mainButtonAction() {
        if selectSettingsBar.isHidden == false {
            disableTopBar()
            showHUD()

            switch(hoveredItem) {
                case "Style":
                    if let styleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "styleVC") as? StyleController {
                        styleVC.styleDelegate = self
                        self.present(styleVC, animated: true, completion: nil)
                    }
                
                case "Language":
                    if let languageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "languageVC") as? LanguageController {
                        languageVC.languageDelegate = self
                        self.present(languageVC, animated: true, completion: nil)
                    }
                
                case "Add-Ons":
                    if let inAppPurchaseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inAppPurchaseVC") as? InAppPurchaseController {
//                        inAppPurchaseVC.languageDelegate = self
                        self.present(inAppPurchaseVC, animated: true, completion: nil)
                }
                
                default:
                    if let styleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "styleVC") as? StyleController {
                        styleVC.styleDelegate = self
                        self.present(styleVC, animated: true, completion: nil)
                    }
            }
        }
    }
    
    func doLaunchStuff() {
        
    }
    
    func showHUD() {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Updating"
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 3.0)
    }
    
    func hideHUD() {
        let hud = JGProgressHUD(style: .dark)
        hud.dismiss()
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
            case "English12", "English24":
                dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
                
                switch(timeFormat) {
                    case "English12":
                        dateFormatter.dateFormat = "hh"
                    
                    case "English24":
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
                
                if(timeFormat == "English24") {
                    timeEnding = ""
                }
                
                timeSlotEnd.text = " \(timeEnding)"
            
                dateSlot1.text = "\(thisDayofWeek)"
                dateSlot2.text = " \(thisMonth)"
                dateSlot3.text = " \(thisDayNumber), "
                dateSlot4.text = "\(thisYear)"
            
                timeZoneSlot.text = "\(thisTimezone)"
            
                currentRegionSelected.text = currentRegionDescription
            
        case "Spanish":
            dateFormatter.locale = NSLocale(localeIdentifier: "es") as Locale?
            
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
            
            dateFormatter.dateFormat = "EEEE"
            var thisDayofWeek = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "MMMM"
            let thisMonth = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "d"
            let thisDayNumber = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "yyyy"
            let thisYear = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "zzz"
            let thisTimezone = dateFormatter.string(from: currentDate as Date)
            
            switch(thisDayofWeek) {
            case "Sunday":
                thisDayofWeek = "domingo"
                
            case "Monday":
                thisDayofWeek = "lunes"
                
            case "Tuesday":
                thisDayofWeek = "martes"
                
            case "Wednesday":
                thisDayofWeek = "miércoles"
                
            case "Thursday":
                thisDayofWeek = "jueves"
                
            case "Friday":
                thisDayofWeek = "viernes"
                
            case "Saturday":
                thisDayofWeek = "sábado"
                
            default:
                thisDayofWeek = "domingo"
            }
            
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
            dateSlot3.text = " \(thisDayNumber) "
            dateSlot4.text = "\(thisYear)"
            
            timeZoneSlot.text = "\(thisTimezone)"
            
            currentRegionSelected.text = currentRegionDescription
            
            case "French":
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
            
            case "Swahili":
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
            
            case "SwahiliCongo":
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
        let themeSettings = themeInfo[currentTheme] //themeData[currentTheme]
        
//        debugPrint(themeInfo[currentTheme])
        
        if themeSettings!["background"] == "color" {
            updateBgColor(bgColor: themeSettings!["bgColor"]!)
        }

        if themeSettings!["background"] == "image" {
            let imageThumbnailName = "theme-background-\(themeSettings!["bgImage"]!)"
            updateBgImage(bgImage: imageThumbnailName)
        }

        if themeSettings!["font"] == "custom" {
            updateFont(font: themeSettings!["fontName"]!)
        }

        if themeSettings!["fontEffect"] == "glow" {
            makeFontGlow(fontColor: themeSettings!["fontColor"]!)
        } else {
            makeFontNoGlow(fontColor: themeSettings!["fontColor"]!)
        }

        updateFontColor(fontColor: themeSettings!["fontColor"]!)
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
        let imageBackgroundName = "theme-background-\(bgImage).png"
        view.backgroundColor = UIColor(patternImage: scaleImageToSize(size: view.bounds.size, image: UIImage(named: imageBackgroundName)!))
        
    }
    
    func scaleImageToSize(size: CGSize, image: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        let imageR = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageR!
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
        
        attributionLabel.textColor = newColor
    }
    
    func updateFont(font: String) {
        let newFont = UIFont(name: font, size: 135)
        let newFontMed = UIFont(name: font, size: 85)
        let newFontSm = UIFont(name: font, size: 50)
        let newFontXs = UIFont(name: font, size: 24)
        
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
        
        attributionLabel.font = newFontXs
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
        
        attributionLabel.layer.shadowColor = newColor.cgColor
        attributionLabel.layer.shadowOffset = .zero
        attributionLabel.layer.shadowRadius = 0.0
        attributionLabel.layer.shadowOpacity = 0.0
        attributionLabel.layer.masksToBounds = false
        attributionLabel.layer.shouldRasterize = false
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
        
        attributionLabel.layer.shadowColor = newColor.cgColor
        attributionLabel.layer.shadowOffset = .zero
        attributionLabel.layer.shadowRadius = 25.0
        attributionLabel.layer.shadowOpacity = 0.9
        attributionLabel.layer.masksToBounds = false
        attributionLabel.layer.shouldRasterize = true
    }
    
    func userChangedStyle(rowNumber: Int, cellNumber: Int) {
        hideHUD()
        
        selectedRowNumber = rowNumber
        selectedCellNumber = cellNumber
        currentTheme = "\(rowNumber)\(selectedCellNumber)"
        
//        print("ROW \(selectedRowNumber) , CELL \(selectedCellNumber) , currentTheme \(currentTheme)")
        
        updateTheme()
    }
    
    func userChangedLanguage(languageNumber: Int) {
        hideHUD()
        
        currentRegion = languageNumber
        
        updateClock()
    }
    
}

