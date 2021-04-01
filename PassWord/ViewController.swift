//
//  ViewController.swift
//  PassWord
//
//  Created by chia on 2021/3/31.
//

import UIKit

class ViewController: UIViewController, GetPW {


    var timesofWrong: Int = 0
    var inputNum: String = ""
    var password: String = "000000"
    @IBOutlet weak var Password1: UIButton!
    @IBOutlet weak var Password2: UIButton!
    @IBOutlet weak var Password3: UIButton!
    @IBOutlet weak var Password4: UIButton!
    @IBOutlet weak var Password5: UIButton!
    @IBOutlet weak var Password6: UIButton!
    @IBOutlet weak var PSWStackView: UIStackView!
    @IBOutlet weak var Button0: UIButton!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var LabelHint: UILabel!
    func receivePSW(psw: String) {
        password = psw
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputNum = ""
        CancelButton.isHidden = false
        DeleteButton.isHidden = true
    }

    
    @IBAction func enterPassword(_ sender: UIButton) {
        if timesofWrong < 6 {
            switch sender {
            case Button0:
                inputNum += "0"
            case Button1:
                inputNum += "1"
            case Button2:
                inputNum += "2"
            case Button3:
                inputNum += "3"
            case Button4:
                inputNum += "4"
            case Button5:
                inputNum += "5"
            case Button6:
                inputNum += "6"
            case Button7:
                inputNum += "7"
            case Button8:
                inputNum += "8"
            case Button9:
                inputNum += "9"
            default:
                restartInput()
            }
            detectImage()
            PasswordCorrect()
        } else {
            LabelHint.text = "請稍後再試"
        }
    }
    @IBAction func DeletePassword(_ sender: Any) {
        removeInputNum()
        deleteInputNum()
    }
    
    func restartInput() {
        inputNum = ""
        timesofWrong += 1
        Password1.setImage(UIImage(systemName: "circle"), for: .normal)
        Password2.setImage(UIImage(systemName: "circle"), for: .normal)
        Password3.setImage(UIImage(systemName: "circle"), for: .normal)
        Password4.setImage(UIImage(systemName: "circle"), for: .normal)
        Password5.setImage(UIImage(systemName: "circle"), for: .normal)
        Password6.setImage(UIImage(systemName: "circle"), for: .normal)
        CancelButton.isHidden = false
        DeleteButton.isHidden = true
        let codeShake = CABasicAnimation(keyPath: "position")
        codeShake.duration = 0.15
        codeShake.repeatCount = 2
        codeShake.fromValue = NSValue(cgPoint: CGPoint(x: PSWStackView.center.x - 30, y: PSWStackView.center.y))
        codeShake.toValue = NSValue(cgPoint: CGPoint(x: PSWStackView.center.x + 30, y: PSWStackView.center.y))
        PSWStackView.layer.add(codeShake, forKey: "position")
    }
    func detectImage() {
        let NumnerTotal = inputNum.count
        switch NumnerTotal {
        case 1:
            Password1.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            CancelButton.isHidden = true
            DeleteButton.isHidden = false
        case 2:
            Password2.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        case 3:
            Password3.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        case 4:
            Password4.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        case 5:
            Password5.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        case 6:
            Password6.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        default:
            restartInput()
        }
    }
    func removeInputNum(){
       if(inputNum.count>0 && inputNum.count<6){
           inputNum.removeLast()
       }
       
       
    }
    func deleteInputNum(){
      let deleteNum = inputNum.count + 1
      switch deleteNum {
      case 5:
        Password5.setImage(UIImage(systemName: "circle"), for: .normal)
      case 4:
        Password4.setImage(UIImage(systemName: "circle"), for: .normal)
      case 3:
        Password3.setImage(UIImage(systemName: "circle"), for: .normal)
      case 2:
        Password2.setImage(UIImage(systemName: "circle"), for: .normal)
      case 1:
        Password1.setImage(UIImage(systemName: "circle"), for: .normal)
        CancelButton.isHidden = false
        DeleteButton.isHidden = true

      default:
        restartInput()
         }
      }
    func PasswordCorrect() {
        if inputNum.count == 6 {
            if inputNum == password {
                self.performSegue(withIdentifier: "PasswordCorrect", sender: Any?.self)
            } else {
                restartInput()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pswVC = segue.destination as? Password {
            pswVC.presentPSW = password
            pswVC.delegate = self
        }
    }
    
    @IBAction func CancelDissmiss(_ sender: Any) {

    }
}
