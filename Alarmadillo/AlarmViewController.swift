//
//  AlarmViewController.swift
//  Alarmadillo
//
//  Created by Amanda Reinhard on 6/11/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit

class AlarmViewController: UITableViewController {
    
    var alarm: Alarm! 

    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet var name: UITextField!
    @IBOutlet var caption: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tapToSelectImage: UILabel!
    @IBAction func datePickerChanged(_ sender: Any) {
    }
    @IBAction func imageViewTapped(_ sender: Any) {
    }
}
