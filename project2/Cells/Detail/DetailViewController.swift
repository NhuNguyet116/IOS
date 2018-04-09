//
//  DetailViewController.swift
//  project2
//
//  Created by Nhu Nguyet  on 3/31/18.
//  Copyright © 2018 Nhu Nguyet . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: ImportData?
    
    @IBOutlet weak var imageViewLoad: UIImageView!
    
    @IBOutlet weak var textFieldLoad: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = data {
            imageViewLoad.image = data.image
            textFieldLoad.text = data.name
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 */
   

}
