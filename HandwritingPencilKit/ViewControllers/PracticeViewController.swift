//
//  PracticeViewController.swift
//  HandwritingPencilKit
//
//  Created by Igor Polousov on 09.05.2025.
//

import UIKit
import PencilKit

class PracticeViewController: UIViewController, PKCanvasViewDelegate, CALayerDelegate, UIPopoverPresentationControllerDelegate, UIScribbleInteractionDelegate {
    
    
    @IBOutlet weak var backgroundCanvasView: PKCanvasView!
    @IBOutlet weak var canvasView: PKCanvasView!
    @IBOutlet weak var practiceTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
