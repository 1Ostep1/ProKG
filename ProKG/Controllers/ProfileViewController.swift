import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet var userName: UITextField!
  @IBOutlet var password: UITextField!
  @IBOutlet var loginBtn: UIButton!
  @IBOutlet var signUpBrn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loginBtn.layer.cornerRadius = self.view.frame.width / 20
    signUpBrn.layer.cornerRadius = self.view.frame.width / 20
    password.isSecureTextEntry = true
  }
  
  @IBAction func signInPressed(_ sender: UIButton) {
    print(userName.text)
    print(password.text)
  }
  
  @IBAction func signUpPressed(_ sender: UIButton) {
  }
  @IBAction func passwordVisible(_ sender: UIButton) {
    password.isSecureTextEntry = !password.isSecureTextEntry
    sender.setImage(UIImage(systemName: "eye"), for: .normal)
  }
}
