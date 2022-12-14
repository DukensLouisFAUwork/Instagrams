//
//  CameraViewController.swift
//  Instagram
//
//  Created by dwork on 10/10/22.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageoutlet: UIImageView!
    
    
    @IBOutlet weak var cameratextfeild: UITextField!
    
    @IBAction func submitbutton(_ sender: Any) {
        
        let post = PFObject(className: "Posts")
        post["caption"] = cameratextfeild.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageoutlet.image!.pngData()
        
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file

        post.saveInBackground{(success, error)
            in if success{
                print("saved!")
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("error!")
            }
        }
        
    }
    
     @IBAction func onCamerabutton(_ sender: Any) {
         let picker = UIImagePickerController()
         picker.delegate = self
         picker.allowsEditing = true
         
         if UIImagePickerController.isSourceTypeAvailable(.camera){
             picker.sourceType = .camera
         }
         else{
             picker.sourceType = .photoLibrary
         }
         present(picker, animated: true, completion: nil)
     }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageoutlet.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
