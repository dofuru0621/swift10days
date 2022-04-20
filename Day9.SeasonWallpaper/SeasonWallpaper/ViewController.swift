//
//  ViewController.swift
//  UIelements
//
//  Created by Chia on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var seasonNameImageView: UIImageView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var labelSwitch: UISwitch!
    @IBOutlet var transparencySlider: UISlider!
    @IBOutlet var generateButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    let seasons = ["spring", "summer", "autumn", "winter"]
    
    var season: String = "autumn"
    var transparency: CGFloat = 0.5
    var showLabel: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Mali-Regular", size: 15)!], for: .normal)
        checkSeason(date: Date.now)
        seasonChanged()
    }

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        season = seasons[sender.selectedSegmentIndex]
        seasonChanged()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        checkSeason(date: sender.date)
        seasonChanged()
    }
    
    @IBAction func labelSwitchChanged(_ sender: UISwitch) {
        showLabel = sender.isOn
        seasonNameImageView.isHidden = showLabel ? false: true
    }
    
    @IBAction func transparencySliderChanged(_ sender: UISlider) {
        transparency = CGFloat(sender.value)
        backgroundImageView.alpha = transparency
    }
    
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        season = seasons[sender.currentPage]
        seasonChanged()
    }
    
    func seasonChanged() {
        // Change background image & season name image
        backgroundImageView.image = UIImage(named: "\(season)-background")
        seasonNameImageView.image = UIImage(named: season)
        // Change color of UI elements
        labelSwitch.onTintColor = UIColor(named: season)
        transparencySlider.minimumTrackTintColor = UIColor(named: season)
        generateButton.backgroundColor = UIColor(named: season)
        pageControl.backgroundColor = UIColor(named: season)
        // Change index of SegmentedControl & PageControl
        let seasonIndex: [String: Int] = ["spring": 0, "summer": 1, "autumn": 2, "winter": 3]
        segmentedControl.selectedSegmentIndex = seasons.firstIndex(of: season)!
        pageControl.currentPage = seasonIndex[season]!
    }
    
    func checkSeason(date: Date) {
        // Get month name from date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let month = dateFormatter.string(from: date)
        // Change season value from month name
        switch month {
        case "March", "April", "May": season = "spring"
        case "June", "July", "August": season = "summer"
        case "September", "October", "November": season = "autumn"
        case "December", "January", "February": season = "winter"
        default: season = "autumn"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? PhotoViewController
        controller?.season = season
        controller?.transparency = transparency
        controller?.showLabel = showLabel
    }
}

