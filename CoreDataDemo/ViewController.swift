//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 吴伟城 on 16/1/5.
//  Copyright © 2016年 cn-wu.cn. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedObjectContext = appDelegate.managedObjectContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadBooks() -> [AnyObject] {
        let fetchRequest = NSFetchRequest(entityName: "Book")
        var result = [AnyObject]()
        do {
            result = try managedObjectContext!.executeFetchRequest(fetchRequest)
        } catch let error as NSError {
            NSLog("The Error: %@", error)
        }
        return result
    }

    @IBAction func addNew(sender: AnyObject) {
        let book = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: managedObjectContext) as! Book
        book.title = "My Book - " + String(loadBooks().count)
        do {
            try managedObjectContext!.save()
        } catch let error as NSError {
            NSLog("The Error: ", error)
        }
        tableView.reloadData()
    }
    
    // MARK: - data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadBooks().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        let book = loadBooks()[indexPath.row] as! Book
        cell?.textLabel!.text = book.title
        return cell!
    }

}























