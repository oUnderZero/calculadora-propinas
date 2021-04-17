

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var totalCuentaTextField: UITextField!
    @IBOutlet weak var porcentajeLabel: UILabel!
    @IBOutlet weak var personasLabel: UILabel!
    @IBOutlet weak var porcentajeSlider: UISlider!
    @IBOutlet weak var personasSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.systemBlue.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    @IBAction func porcentajeSliderAction(_ sender: UISlider) {
        porcentajeLabel.text = "\(String(format: "%.0f", sender.value))%"
    }
    
    @IBAction func personasSliderAction(_ sender: UISlider) {
        if sender.value < 1.5 {
            personasLabel.text = "\(String(format: "%.0f", sender.value)) persona"
        } else {
            personasLabel.text = "\(String(format: "%.0f", sender.value)) personas"
        }
    }
    
    func calcular() -> Float{
        let totalCuenta = Int(totalCuentaTextField.text!)
        let cantidadPorcentaje = Int(porcentajeSlider.value)
        let cantidadPersonas = Int(personasSlider.value)
        
        let porcentajeTotal = Float((cantidadPorcentaje * totalCuenta!) / (100))
        let semitotal = Float(totalCuenta!) + (porcentajeTotal)
        let total = Float(semitotal) / Float(cantidadPersonas)
        return total
    }
    
    @IBAction func calcularTotalButton(_ sender: UIButton) {
        if totalCuentaTextField.text == "" {
            let alert = UIAlertController(title: "Escribiste la cantidad de la cuenta?", message: "Debes escribir la cantidad total de tu cuenta", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "enviarResultado", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarResultado" {
            if totalCuentaTextField.text == "" {
                let alert = UIAlertController(title: "Escribiste la cantidad de la cuenta?", message: "Debes escribir la cantidad total de tu cuenta", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            } else {
                let objDestinoVC = segue.destination as! ResultadoViewController
                objDestinoVC.recibirResultado = calcular()
            }
        }
    }
    

}

