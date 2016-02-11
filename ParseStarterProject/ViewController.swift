/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var imagePicked: UIImageView!
    let loading = UIActivityIndicatorView()
    
    @IBAction func alert(sender: AnyObject) {
        let alert = UIAlertController(title: "Alerta", message: "AJAJJAJA", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    @IBAction func play(sender: AnyObject) {
        self.loading.stopAnimating()
    }
    @IBAction func pause(sender: AnyObject) {
        self.loading.center = self.view.center
        self.loading.activityIndicatorViewStyle = .Gray
        self.loading.hidesWhenStopped = true
        self.loading.startAnimating()
        self.view.addSubview(self.loading)
    }
    @IBAction func addImage(sender: AnyObject) {
        //Carga imagen de la galeria de fotos
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imagePicked.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Upload data
//        let score = PFObject(className: "user")
//        score["name"] = "Manuel"
//        score["password"] = "1234"
//        score.saveInBackgroundWithBlock { (success, error) -> Void in
//            if success{
//                print(score)
//            }else{
//                print(error)
//            }
//        }
        //MARK: - Request data
//        let query = PFQuery(className: "user")
//        query.getObjectInBackgroundWithId("1Gk4TE465M") { (object, error) -> Void in
//            if error == nil{
//                print(object!)
//                object!["name"] = "duivan"
//                object!["score"] = 0
//                object!["age"] = 30
//                object!.saveInBackgroundWithBlock { (success, error) -> Void in
//                    if success{
//                        print(object)
//                    }else{
//                        print(error)
//                    }
//                }
//            }else{
//                print(error)
//            }
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
