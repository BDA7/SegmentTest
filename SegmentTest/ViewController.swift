//
//  ViewController.swift
//  SegmentTest
//
//  Created by d.bondarenko on 17.02.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let metrics = ["seconds", "minutes", "hours"]
    var val = (0, 0.0)

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var label: UILabel!

    lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: metrics)
        segment.addTarget(self, action: #selector(choiceMetric), for: .valueChanged)
        return segment
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0.0"
        setupSegment()
    }

    func setupSegment() {
        segment.frame = CGRect(x: 40, y: 50, width: 350, height: 50)
        segment.selectedSegmentIndex = 0
        view.addSubview(segment)
    }

    @objc
    func choiceMetric(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            covert(value: val.1, typeValue: sender.selectedSegmentIndex, typeToConvert: val.0)
            val.0 = 0
            val.1 = Double(inputText.text!) ?? 0.0
        case 1:
            covert(value: val.1, typeValue: sender.selectedSegmentIndex, typeToConvert: val.0)
            val.0 = 1
            val.1 = Double(inputText.text!) ?? 0.0
        case 2:
            covert(value: val.1, typeValue: sender.selectedSegmentIndex, typeToConvert: val.0)
            val.0 = 2
            val.1 = Double(inputText.text!) ?? 0.0
        default:
            break
        }
    }

    func covert(value: Double, typeValue: Int, typeToConvert: Int) {
        switch typeValue {
        case 0:
            if typeToConvert == 1 {
                label.text = String(convertMiddleMax(value: value))
            } else if typeToConvert == 2 {
                label.text = String(convertMax(value: value))
            }
        case 1:
            if typeToConvert == 0 {
                label.text = String(convertMiddleSmall(value: value))
            } else if typeToConvert == 2 {
                label.text = String(convertMiddleMax(value: value))
            }
        case 2:
            if typeToConvert == 0 {
                label.text = String(convertMaxSmall(value: value))
            } else if typeToConvert == 1 {
                label.text = String(convertMiddleSmall(value: value))
            }
        default:
            break
        }
    }

    func convertMiddleSmall(value: Double) -> Double {
        return value/60
    }

    func convertMaxSmall(value: Double) -> Double {
        return value/360
    }

    func convertMiddleMax(value: Double) -> Double {
        return value*60
    }
    func convertMax(value: Double) -> Double {
        return value*360
    }
}

