//
//  AddTaskViewController.swift
//  FinalPoc
//
//  Created by Elias Paulino on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timePickerView: UIPickerView! {
        didSet {
            timePickerView.delegate = self
            timePickerView.dataSource = self
        }
    }
    
    public weak var delegate: AddTaskViewControllerDelegate?
    
    lazy var saveButton: UIBarButtonItem = {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        return saveButton
    }()
    
    lazy var cancelButton: UIBarButtonItem = {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        return cancelButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
    }
    
    func setupNavigationController() {
        self.title = "New Task"
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func saveTapped() {
        dismiss(animated: true) { [weak self] in
            guard let self = self else {
                return
            }
            let task = Task(name: self.nameTextField.text ?? "", spendTime: (
                hour: self.timePickerView.selectedRow(inComponent: 0),
                minutes: self.timePickerView.selectedRow(inComponent: 1)
            ))
            self.delegate?.taskWasAdd(task: task)
        }
    }
    
    @objc func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension AddTaskViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        }
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}
