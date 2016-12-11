//
//  GroupListTableViewController.swift
//  VK Admin
//
//  Created by Orange on 10.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit

class GroupListTableViewController: UITableViewController {

	@IBOutlet var GroupListTable: UITableView!

	@IBOutlet weak var logOutButton: UIButton!

	@IBAction func LogOutButtonPressed(_ sender: Any) {
		Authorizator.instance.clearAuthData()
		performSegue(withIdentifier: "logOutSegue", sender: self)
	}

	var groups: [Int: Group] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()


		groups = Group.getGroupArray()
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return GroupList.count+1
        //return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let curIndex: Int = indexPath.row
		if GroupList.count - curIndex > 0 {
			//let cell: GroupListCell
			//cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCell", for: indexPath) as! GroupListCell
			let cell = Bundle.main.loadNibNamed("GroupListCell", owner: self, options: nil)?.first as! GroupListCell
			cell.titleLabel.text = self.groups[curIndex]?.name
			cell.subtitleLabel.text = self.groups[curIndex]?.position.name
			if self.groups[curIndex]?.newMessages != 0 {
				cell.messagesLabel.text = "+ " + String(describing: self.groups[curIndex]!.newMessages)
			} else {
				cell.messagesLabel.text = ""
			}
			return cell
		} else {
			//let cell: GroupListCreateGroupCell
			//cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCreateGroupCell", for: indexPath) as! GroupListCreateGroupCell
			let cell = Bundle.main.loadNibNamed("GroupListCreateGroupCell", owner: self, options: nil)?.first as! GroupListCreateGroupCell
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let rowId = indexPath.row
		SelectedGroup = GroupList[rowId]
		performSegue(withIdentifier: "OpenGroupSegue", sender: self)
	}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
