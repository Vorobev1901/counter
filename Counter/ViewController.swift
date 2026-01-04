//
//  ViewController.swift
//  Counter
//
//  Created by Nikita Vorobiev on 05.01.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        counter+=1
        updateCounterLabel()
        appendHistory("значение изменено на +1")
    }
    
    @IBAction func decrementCounter(_ sender: Any) {
        if counter > 0 {
            counter-=1
            updateCounterLabel()
            appendHistory("значение изменено на -1")
        } else {
            appendHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        counter=0
        updateCounterLabel()
        appendHistory("значение сброшено")
    }
    
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func appendHistory(_ text: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: Date())
        
        historyTextView.text += "\n[\(dateString)]: \(text)"
        scrollHistoryToBottom()
    }
    
    private func scrollHistoryToBottom() {
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
}

