//
//  Form.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/24/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import UIKit

enum PageType: String {
    case eating = "Eating Healthy"
    case travel = "Traveling"
    case agriculture = "Agriculture"
    case cleanup = "Cleaning Up"
}

class FormViewController : UIViewController {
    
    @IBOutlet weak var activityField: UITextField!
    @IBOutlet weak var weekdayPicker: UIPickerView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var successText: UILabel!
    
    var pageTitle: String?
    var nosePicker: [String] = ["Monday", "Tuesday", "Wednesday", "Tuesday", "Friday", "Saturday", "Sunday"]
    
    // stuffs to send to other things
    var pickedWeekday = ""
    var pickedActivity = ""
    
    class func create(type: PageType) -> FormViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let fvc = storyboard.instantiateViewController(withIdentifier: "formVC") as! FormViewController
        fvc.pageTitle = type.rawValue
        
        _ = fvc.view
        // use this for images
        switch type {
        case .eating:
            fvc.topImage.image = UIImage(named: "eats")
        case .travel:
            fvc.topImage.image = UIImage(named: "walk") // TODO: change these
        case .agriculture:
            fvc.topImage.image = UIImage(named: "flower")
        case .cleanup:
            fvc.topImage.image = UIImage(named: "broom")
        }
        return fvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekdayPicker.dataSource = self
        weekdayPicker.delegate = self
        activityField.delegate = self
        
        self.title = pageTitle
    }
    
    @IBAction func tappedSubmit(_ sender: UIButton) {
        activityField.endEditing(true)
        print("User selected: \(pickedWeekday), \(pickedActivity)")
        let event = Event.init(activity: pickedActivity, weekday: pickedWeekday)
        
        ActivityData.shared.allActivities.append(event)
        successText.text = "Success!"
    }
}

extension FormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nosePicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedWeekday = nosePicker[row]
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        pickedActivity = textField.text ?? ""
    }
}
