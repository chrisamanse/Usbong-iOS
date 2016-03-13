//
//  LicensesTableViewController.swift
//  Usbong
//
//  Created by Joe Amanse on 13/03/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import UIKit

class LicensesTableViewController: UITableViewController {
    let licenses = ["Crypto", "SWXMLHash", "UsbongKit", "ZipArchive"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return licenses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = licenses[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "showLicense" else { return }
        guard let licenseVC = segue.destinationViewController as? LicenseTableViewController else { return }
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        
        licenseVC.license = licenses[selectedRow]
    }
    
}
