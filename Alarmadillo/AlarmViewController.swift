//
//  AlarmViewController.swift
//  Alarmadillo
//
//  Created by Amanda Reinhard on 6/11/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit

class AlarmViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var alarm: Alarm! 

    override func viewDidLoad() {
        super.viewDidLoad()

        title = alarm.name
        name.text = alarm.name
        caption.text = alarm.caption
        datePicker.date = alarm.time
        
        if alarm.image.count > 0 {
            let imageFilename = Helper.getDocumentsDirectory().appendingPathComponent(alarm.image)
            
            imageView.image = UIImage(contentsOfFile: imageFilename.path)
            tapToSelectImage.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        alarm.name = name.text!
        alarm.caption = caption.text!
        title = alarm.name
        save()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        let fm = FileManager()
        
        if alarm.image.count > 0 {
            do {
                let currentImage = Helper.getDocumentsDirectory().appendingPathComponent(alarm.image)
                
                if fm.fileExists(atPath: currentImage.path) {
                    try fm.removeItem(at: currentImage)
                }
            } catch {
                print("Failed to remove current image")
            }
        }
        
        do {
            alarm.image = "\(UUID().uuidString).jpg"
            
            let newPath = Helper.getDocumentsDirectory().appendingPathComponent(alarm.image)
            
            let jpeg = UIImageJPEGRepresentation(image, 80)
            try jpeg?.write(to: newPath)
            save()
        } catch {
            print("Failed to save new image.")
        }
        
        imageView.image = image
        tapToSelectImage.isHidden = true
    }
    
    @objc func save() {
        NotificationCenter.default.post(name: Notification.Name("save"), object: nil)
    }

    @IBOutlet var name: UITextField!
    @IBOutlet var caption: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tapToSelectImage: UILabel!
    
    @IBAction func datePickerChanged(_ sender: Any) {
        alarm.time = datePicker.date
        save()
    }
    
    @IBAction func imageViewTapped(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.modalPresentationStyle = .formSheet
        vc.delegate = self
        present(vc, animated: true)
    }
}
