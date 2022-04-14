//
//  ViewController.swift
//  orderMeal
//
//  Created by Chia on 2021/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Meal Image Outlet
    @IBOutlet var beverageImage: UIImageView!
    @IBOutlet var hamburgerImage: UIImageView!
    @IBOutlet var friesImage: UIImageView!
    @IBOutlet var friesWidth: NSLayoutConstraint!
    @IBOutlet var hamburgerWidth: NSLayoutConstraint!
    
    // MARK: - Order Message Outlet
    @IBOutlet var beforeOrderMessageLabel: UILabel!
    @IBOutlet var afterOrderMessageLabel: UILabel!
    @IBOutlet var orderNumberLabel: UILabel! {
        didSet {
            orderNumberLabel.clipsToBounds = true
            orderNumberLabel.layer.cornerRadius = orderNumberLabel.bounds.width/2
        }
    }
   
    // MARK: - Form Outlet
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var beverageSegmentedControl: UISegmentedControl! {
        didSet {
            if let customFont = UIFont(name: "Gaegu-Regular", size: 20.0) {
                let attr = [NSAttributedString.Key.font: customFont]
                beverageSegmentedControl.setTitleTextAttributes(attr, for: UIControl.State.normal)
            }
        }
    }
    @IBOutlet var friesSlider: UISlider!
    @IBOutlet var friesSizeLabel: UILabel!
    @IBOutlet var hamburgerSizeSwitch: UISwitch!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide meal images, order number and order message
        beverageImage.isHidden = true
        hamburgerImage.isHidden = true
        friesImage.isHidden = true
        afterOrderMessageLabel.isHidden = true
        orderNumberLabel.isHidden = true
        
        // Initial Setting
        beverageSegmentedControl.selectedSegmentIndex = 0
        friesSlider.value = 2
        friesSizeLabel.text = "Medium"
        hamburgerSizeSwitch.isOn = false
        
        
    }
    
    // MARK: - Fries Slider
    @IBAction func friesSliderChange(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(), animated: false)
        let sliderValue = Int(sender.value)
        switch sliderValue {
        case 1:
            friesSizeLabel.text = "Small"
        case 2:
            friesSizeLabel.text = "Medium"
        case 3:
            friesSizeLabel.text = "Large"
        default:
            friesSizeLabel.text = "Medium"
        }
    }
    
    // MARK: - Order Button
    @IBAction func orderPressed(_ sender: Any) {
        // Close keyboard
        view.endEditing(true)
        
        // Show meal images, order number and order message
        beverageImage.isHidden = false
        hamburgerImage.isHidden = false
        friesImage.isHidden = false
        afterOrderMessageLabel.isHidden = false
        orderNumberLabel.isHidden = false
        // Hide Welcome Message
        beforeOrderMessageLabel.isHidden = true
        
        // Beverage
        let beverageIndex = beverageSegmentedControl.selectedSegmentIndex
        let beverage = beverageSegmentedControl.titleForSegment(at: beverageIndex)!
        beverageImage.image = UIImage(named: beverage.lowercased())
        
        // Fries size
        switch friesSlider.value {
        case 1:
            friesWidth.constant = 100
        case 2:
            friesWidth.constant = 150
        case 3:
            friesWidth.constant = 200
        default:
            friesWidth.constant = 150
        }
        
        // Hamburger size
        if hamburgerSizeSwitch.isOn {
            hamburgerWidth.constant = 200
        } else {
            hamburgerWidth.constant = 150
        }
        
        // Show order number(random)
        orderNumberLabel.text = String(Int.random(in: 1...20))
        
        // Change message
        let name = nameTextField.text!
        afterOrderMessageLabel.text = "\(name), your meal is ready."
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}
