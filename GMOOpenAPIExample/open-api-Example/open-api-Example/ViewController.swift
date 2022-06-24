import UIKit
import GMOOpenAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("viewDidLoad")

    }
    @IBAction func didSelectedButton(_ sender: UIButton) {
        print("didSelectedButton")

        AccountAPI.corporation { model in
            print("success")
            debugPrint(model)
        } failure: { error in
            print("failure")
            debugPrint(error)
        }

    }
}

