//
//  StyleController.swift
//
//  Created by Kevin Sawicke on 6/29/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit
import JGProgressHUD

protocol ChangeStyleDelegate {
    
    func userChangedStyle (rowNumber: Int, cellNumber: Int)
    
}

class StyleController: UIViewController {
    
    var delegate : ChangeStyleDelegate?
    
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
    
    var themeCollections = [
        "Wood", "Stone", "Night"
    ]
    var themeNames = [
        "Red Barn", "Orange Horizon", "Light Warm", "Med Brown", "Chip Wood", "Dark Stain Wood", "Weathered Barn", "Gray Wood", "Zebra Wood",
        
        "Red Brick Shadow", "Red Brick", "Gray Brick", "Slate Brick", "Yellow Orange", "Blue Marble", "Gray Marble", "Black Tile", "Dark Slate",
        
        "Highway", "Tent", "Cactus", "Dock", "Circle Sky", "Pines", "Borealis", "Cabin", "Nebula"
    ]
    
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
    
    // MARK: - Singleton properties
    
    // MARK: - Static properties
    
    // MARK: - Public properties
    
    // MARK: - Public methods
    
    // MARK: - Initialize/Livecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.register(CatalogueTableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
        
        images = []
        
        //    print(themeData[0]["background"]!)
    }
    
    // MARK: - Override methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // MARK: - Private properties
    
    /// property to represent the table view on the UI
    fileprivate var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: CGRect.zero)
            tableView.backgroundColor = .black
            view.addSubview(tableView)
        }
    }
    
    /// private property to store the table row's height
    fileprivate let rowHeight = UIScreen.main.bounds.height * 0.25
    
    /// private property to store the table cell's identifier
    fileprivate var tableCellIdentifier = "CATALOG_TABLE_CELL_ID"
    
    fileprivate var themegroup1Images : Array<UIImage> = []
    fileprivate var themegroup2Images : Array<UIImage> = []
    fileprivate var themegroup3Images : Array<UIImage> = []
    
    fileprivate var images: [[UIImage]]! {
        didSet {
            for x in 1 ... 9 {
                themegroup1Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            for x in 10 ... 18 {
                themegroup2Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            for x in 19 ... 27 {
                themegroup3Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            images.append(themegroup1Images)
            images.append(themegroup2Images)
            images.append(themegroup3Images)
        }
    }
    
    func showHUD() {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Applying style"
        hud.show(in: self.view)
    }
    
    func hideHUD() {
        let hud = JGProgressHUD(style: .dark)
        hud.dismiss(afterDelay: 3.0)
    }
    
    // MARK: - Private methods
}

// MARK: - UITableViewDelegate's methods
extension StyleController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (rowHeight) * 0.2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func applyStyleToClock(rowNumber: Int, cellNumber: Int) {
                print(rowNumber)
                print(cellNumber)
        
        delegate?.userChangedStyle(rowNumber: rowNumber, cellNumber: cellNumber)

        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource's methods
extension StyleController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as? CatalogueTableViewCell {
             _cell.titles = [String](repeating: "\(indexPath.section + 1),", count: 9)
            _cell.images = images[indexPath.section]
            _cell.delegate = self
            return _cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.font = titleLabel.font.withSize(22)
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (rowHeight) * 0.2).integral
        titleLabel.text = "\(themeCollections[section])"
        headerView.addSubview(titleLabel)
        return headerView
    }

}

// MARK: - CatalogueTableViewCellDelegate methos
extension StyleController: CatalogueTableViewCellDelegate {
    
    func didSelectItem(inCell cell: CatalogueCollectionViewCell) {
        
//        print("SELECTED ITEM!!")
////        debugPrint(cell)
////        print(cell.tag)
//        print(cell.titleText!)
//
        let splitText = cell.titleText!
        var cellArray = splitText.components(separatedBy: ",")
        var rowNumber: Int = 0
        var cellNumber: Int = 0
        
        rowNumber = Int(cellArray[0])!
        cellNumber = Int(cellArray[1])!
        
        applyStyleToClock(rowNumber: rowNumber, cellNumber: cellNumber)
        
//        let clockVC = ClockController()
//        self.present(clockVC, animated: true, completion: nil)
        
//        debugPrint(cell.frame)
//        debugPrint(tableCellIdentifier)
//        print("====")
//        performSegue(withIdentifier: "ShowDetails", sender: nil)
        
    }
    
}
