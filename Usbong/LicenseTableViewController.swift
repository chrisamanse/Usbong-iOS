//
//  LicenseTableViewController.swift
//  Usbong
//
//  Created by Joe Amanse on 13/03/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import UIKit

class LicenseTableViewController: UITableViewController {
    var license: String? {
        didSet {
            navigationItem.title = license ?? "Unkown"
            tableView.reloadData()
        }
    }
    
    var licenseText: String? {
        guard let title = license else { return nil }
        
        return licenseTextForLicense(title)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func licenseTextForLicense(license: String) -> String? {
        guard let url = NSBundle.mainBundle().URLForResource(license, withExtension: "license") else { return nil }
        return try? String(contentsOfURL: url)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = licenseText ?? "No License Found"
        
        return cell
    }
}
