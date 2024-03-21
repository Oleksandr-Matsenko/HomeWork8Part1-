//
//  BlueViewController.swift
//  Lesson8HW
//

//

import UIKit

class BlueViewController: UIViewController, PrinterData {
    func printData(text: String) -> String {
        return ("\(textToPrint()) \(text)")
    }
    
    
    var printer: Printer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
    }
    
    func textToPrint() -> String {
        return "🚙 - синє таксі у дорозі"
    }
    deinit {
        printer?.stop()
        printer?.delegate = nil
    }
   
}

//MARK: - Private
private extension BlueViewController {
    
    func setupUI() {
        view.backgroundColor = .lightBlue
        
        let taxiLabel = UILabel()
        taxiLabel.text = "🚙"
        taxiLabel.font = .systemFont(ofSize: 200.0)
        
        view.addSubview(taxiLabel)
        
        taxiLabel.translatesAutoresizingMaskIntoConstraints = false
        taxiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taxiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setup() {
        
        printer = Printer()
        printer.delegate = self
        
        printer.startPrinting()
    }
}
