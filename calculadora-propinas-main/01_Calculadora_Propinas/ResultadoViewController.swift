

import UIKit

class ResultadoViewController: UIViewController {

    @IBOutlet weak var resultadoLabel: UILabel!
    var recibirResultado: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.systemIndigo.cgColor, UIColor.systemBlue.cgColor]
        view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
        resultadoLabel.text = "\(recibirResultado ?? 0.0) pesos."
    }
    
    @IBAction func regresarButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
