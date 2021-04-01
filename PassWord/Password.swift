//
//  Password.swift
//  PassWord
//
//  Created by chia on 2021/4/1.
//

import UIKit
protocol GetPW: class{
    func receivePSW(psw: String)
    
}
class Password: UIViewController {
    @IBOutlet weak var ChangePSW: UITextField!
    @IBOutlet weak var ConfirmButton: UIButton!
    weak var delegate: GetPW!
    var presentPSW: String = ""
    
    let tenMostCommonPasswords = [
        "123456",
        "111111",
        "222222",
        "333333",
        "444444",
        "555555",
        "666666",
        "777777",
        "888888",
        "999999",
        "000000",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ConfirmPSW(_ sender: Any) {
        if let input = ChangePSW.text {
            if input == presentPSW {
                let alert = UIAlertController(title: "!!!", message: "the password won't change", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                for i in 0...10 {
                    if input.contains(tenMostCommonPasswords[i]) {
                        let controller = UIAlertController(title: "Warning!", message: "your password is not secure", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "I understand", style: .default) { (_) in
                            self.dismiss(animated: false, completion: nil)
                        }
                        controller.addAction(okAction)
                        self.present(controller, animated: true, completion: nil)
                        dismiss(animated: false, completion: nil)
                        return
                    } 
                }
                delegate.receivePSW(psw: input)
                dismiss(animated: true, completion: nil)
            }
           
        }
    }
}
