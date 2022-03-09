//
//  ViewController.swift
//  LearningTask-5.4
//
//  Created by rafael.rollo on 09/03/2022.
//

import UIKit

class AutorFormViewController: UIViewController {

    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoSalvarPressionado(_ sender: UIButton) {
        print("go")
    }
    
    func nomeDeAutorValido(_ nome: String) -> Bool {
        let pattern = #"^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: nome)
    }
    
    func formata(nomeDeAutor: String) -> (String, String) {
        let separador = " "
        let nomeCompleto = nomeDeAutor.components(separatedBy: separador)
        return (nomeCompleto.first!, nomeCompleto.dropFirst().joined(separator: separador))
    }

}
