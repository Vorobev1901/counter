//
//  ViewController.swift
//  Counter
//
//  Created by Nikita Vorobiev on 05.01.2026.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Outlets

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: - Properties
    
    private var counter: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private methods
    
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
    
    // MARK: - Actions
    
    @IBAction private func incrementCounter(_ sender: Any) {
        counter+=1
        updateCounterLabel()
        appendHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementCounter(_ sender: Any) {
        if counter > 0 {
            counter-=1
            updateCounterLabel()
            appendHistory("значение изменено на -1")
        } else {
            appendHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetCounter(_ sender: Any) {
        counter=0
        updateCounterLabel()
        appendHistory("значение сброшено")
    }
    
}

