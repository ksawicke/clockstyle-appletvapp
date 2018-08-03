//
//  StyleController.swift
//
//  Created by Kevin Sawicke on 6/29/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

protocol ChangeStyleDelegate {
    
    func userChangedStyle(rowNumber: Int, cellNumber: Int)
    
}

class StyleController: UIViewController {
    
    var styleDelegate : ChangeStyleDelegate?
    
    var themeCollections = [
        "Wood", "Stone", "Night", "Blues", "Warmth", "Coffee",
        
        // In-App Purchases
        "Bridges", "Bulbs", "Classic Audio", "Classic Cameras",
        "Classic Cars", "Classic Games", "Desert", "Maps", "Palms"
    ]
    
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
    fileprivate var themegroup4Images : Array<UIImage> = []
    fileprivate var themegroup5Images : Array<UIImage> = []
    fileprivate var themegroup6Images : Array<UIImage> = []
    fileprivate var themegroup7Images : Array<UIImage> = []
    fileprivate var themegroup8Images : Array<UIImage> = []
    fileprivate var themegroup9Images : Array<UIImage> = []
    fileprivate var themegroup10Images : Array<UIImage> = []
    fileprivate var themegroup11Images : Array<UIImage> = []
    fileprivate var themegroup12Images : Array<UIImage> = []
    fileprivate var themegroup13Images : Array<UIImage> = []
    fileprivate var themegroup14Images : Array<UIImage> = []
    fileprivate var themegroup15Images : Array<UIImage> = []
    
    fileprivate var images: [[UIImage]]! {
        didSet {
            for x in 1 ... 9 {
                themegroup1Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 10 ... 18 {
                themegroup2Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 19 ... 27 {
                themegroup3Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 28 ... 36 {
                // NOTE: These are color backgrounds. No thumbnail needed.
                themegroup4Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            for x in 37 ... 45 {
                // NOTE: These are color backgrounds. No thumbnail needed.
                themegroup5Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            for x in 46 ... 54 {
                // NOTE: These are color backgrounds. No thumbnail needed.
                themegroup6Images.append(UIImage(named: "theme-background-\(x)")!)
            }
            for x in 55 ... 63 {
                themegroup7Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 64 ... 72 {
                themegroup8Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 73 ... 81 {
                themegroup9Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 82 ... 90 {
                themegroup10Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 91 ... 99 {
                themegroup11Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 100 ... 108 {
                themegroup12Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 109 ... 117 {
                themegroup13Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 118 ... 126 {
                themegroup14Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            for x in 127 ... 135 {
                themegroup15Images.append(UIImage(named: "theme-thumbnail-\(x)")!)
            }
            images.append(themegroup1Images)
            images.append(themegroup2Images)
            images.append(themegroup3Images)
            images.append(themegroup4Images)
            images.append(themegroup5Images)
            images.append(themegroup6Images)
            images.append(themegroup7Images)
            images.append(themegroup8Images)
            images.append(themegroup9Images)
            images.append(themegroup10Images)
            images.append(themegroup11Images)
            images.append(themegroup12Images)
            images.append(themegroup13Images)
            images.append(themegroup14Images)
            images.append(themegroup15Images)
        }
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
        return 15
    }
    
    func saveClockStyleSettings(rowNumber: Int, cellNumber: Int) {
        
        styleDelegate?.userChangedStyle(rowNumber: rowNumber, cellNumber: cellNumber)

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
        titleLabel.font = titleLabel.font.withSize(30)
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (rowHeight) * 0.2).integral
        titleLabel.text = "\(themeCollections[section])"
        headerView.addSubview(titleLabel)
        return headerView
    }

}

// MARK: - CatalogueTableViewCellDelegate methos
extension StyleController: CatalogueTableViewCellDelegate {
    
    func didSelectItem(inCell cell: CatalogueCollectionViewCell) {
        
        let splitText = cell.titleText!
        var cellArray = splitText.components(separatedBy: ",")
        var rowNumber: Int = 0
        var cellNumber: Int = 0
        
        rowNumber = Int(cellArray[0])!
        cellNumber = Int(cellArray[1])!
        
        print("ROW: \(rowNumber) ... CELL: \(cellNumber)")
        
        saveClockStyleSettings(rowNumber: rowNumber, cellNumber: cellNumber)
        
    }
    
}
