//
//  SingUpViewController.swift
//  Instagram
//
//  Created by Gonzalo on 10/02/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse
class SingUpViewController: UIViewController {
    var loading = UIActivityIndicatorView()
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Muestra alerta
    func alertShow(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func register(sender: AnyObject) {
        let username = self.usernameTF.text!
        let password = self.passwordTF.text!
        let email = self.emailTF.text!
        if username == "" || password == "" || email == ""{
            self.alertShow("Espera", message: "Rellena todos los datos")
        }else{
            self.loading.center = self.view.center
            self.loading.activityIndicatorViewStyle = .Gray
            self.loading.hidesWhenStopped = true
            self.loading.startAnimating()
            self.view.addSubview(self.loading)
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            let user = PFUser()
            user.username = username
            user.password = password
            user.email = email
            user.signUpInBackgroundWithBlock {
                (succeeded, error) -> Void in
                self.loading.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    // Show the errorString somewhere and let the user try again
                    self.alertShow("Error", message: String(errorString!))
                } else {
                    self.alertShow("eureka!", message: "Registrado correctamente")
                }
                
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
