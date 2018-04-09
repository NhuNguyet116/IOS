//
//  AddViewController.swift
//  project2
//
//  Created by Nhu Nguyet  on 3/31/18.
//  Copyright © 2018 Nhu Nguyet . All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var didAdd:((_ data: ImportData) -> Void)?
    
    @IBOutlet weak var ImageLoad: UIImageView!
    
    @IBOutlet weak var TextfieldName: UITextField!
    @IBOutlet weak var TextFieldDetail: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextfieldName.placeholder = "Tên sản phẩm"
        TextFieldDetail.placeholder = "Chi tiết"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonAddImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: false, completion: nil)
      
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: false, completion: nil)
        self.ImageLoad.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func ButtonAddCell(_ sender: UIBarButtonItem) {
        let name = TextfieldName.text ?? ""
        let image = ImageLoad.image
        let data = ImportData(name: name, image: image, detail: "")
        InsertCell()
        didAdd?(data)
        
        navigationController?.popViewController(animated: true)
    }
    
    func InsertCell()  {
        if(TextfieldName.text == "") {
            let alert = UIAlertController(title: "Cảnh báo", message: "Mời nhập tên sản phẩm", preferredStyle: UIAlertControllerStyle.alert)
            
            let ok = UIAlertAction(title: "ok", style: .default, handler: { (action) -> Void in
                print("ok")
            })
            
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            return
        }
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

