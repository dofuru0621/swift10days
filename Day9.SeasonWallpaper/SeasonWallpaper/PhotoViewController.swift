//
//  PhotoViewController.swift
//  UIelements
//
//  Created by Chia on 2021/11/09.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var seasonNameImageView: UIImageView!
    @IBOutlet var tapView: UIView!
    
    var season: String = "autumn"
    var transparency: CGFloat = 0.5
    var showLabel: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: "\(season)-background")
        seasonNameImageView.image = UIImage(named: season)
        backgroundImageView.alpha = transparency
        seasonNameImageView.isHidden = showLabel ? false: true
        let tap = UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousPage(_:)))
        tapView.addGestureRecognizer(tap)
    }
    
    @objc func goBackToPreviousPage(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
