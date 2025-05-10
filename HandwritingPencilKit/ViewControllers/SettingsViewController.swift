//
//  SettingsViewController.swift
//  HandwritingPencilKit
//
//  Created by Igor Polousov on 10.05.2025.
//

import UIKit

// Values for segmented control
let practiceScales: [CGFloat] = [0.7, 1.0, 1.25, 1.5, 2.0]
let practiceSpeeds: [CGFloat] = [0.5, 0.75, 1.0, 1.5, 2.0]
let difficulties: [CGFloat] = [20, 10, 7, 5, 4]

extension Collection where Element == CGFloat {
    // A floating point safe version of firstindex
    // Не понятно назначение и в чем безпастность(15:40 10.05.25)
    func firstIndexAlmostEqual(_ value: CGFloat) -> Index? {
        firstIndex { abs($0 - value) < 0.1} // индекс в коллекции значение переменной по этому индексу равно по модулю  разницы элемента коллекции и принимаемого значение и должно быть меньше 0.1
    }
}

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var practiceScaleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var animationSpeedSegmentedControl: UISegmentedControl!
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
