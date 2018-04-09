//
//  ViewController.swift
//  project2
//
//  Created by Nhu Nguyet  on 3/30/18.
//  Copyright © 2018 Nhu Nguyet . All rights reserved.
//

import UIKit

class ImportData {
    var name: String?
    var image: UIImage?
    var detail: String?
    
    init(name: String, image: UIImage?, detail: String) {
        self.name = name
        self.image = image
        self.detail = detail
    }
}

class ViewController: UIViewController, UITableViewDelegate {
    // Passing data
    var myName: String = ""
    
    var selectedData: ImportData?
    @IBOutlet weak var tableview: UITableView!
    
    var list = [ImportData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        let identifier = "CustomTableViewCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        
    
        list = [ImportData(name: "12312", image: UIImage(named: "abc"), detail: "1243w3e"),
                ImportData(name: "xyz", image: UIImage(named: "qqq"), detail: "1243w3e"),
            ImportData(name: "klm", image: UIImage(named: "sss"), detail: "1243w3e"),]
        
        tableview.register(nib, forCellReuseIdentifier: identifier)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddNew(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "push_add", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationController = segue.destination
        
        if segue.identifier == "push_add" {
            if let nextViewController = destinationController as? AddViewController {
                nextViewController.didAdd = { [weak self] data in
                    if let strongSelf = self {
                        strongSelf.list.append(data)
                        strongSelf.tableview.reloadData()
                    }
                }
            }
        }
        else if segue.identifier == "push_detail" {
            if let controller = destinationController as? DetailViewController {
                if let data = selectedData {
                    controller.data = data
                }
            }
        }
       
    }
    
    
    
    
    
}

// MARK: - Table view data source

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.ImageView.image = list[indexPath.row].image
        cell.lblText.text = list[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete){
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = list[indexPath.row]
        performSegue(withIdentifier: "push_detail", sender: nil)
    }
    
    
}

//extension ViewController: UITableViewDelegate {
//
//}

