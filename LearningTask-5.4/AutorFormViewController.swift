//
//  ViewController.swift
//  LearningTask-5.4
//
//  Created by rafael.rollo on 09/03/2022.
//

import UIKit

class AutorFormViewController: UIViewController {
    
    typealias MensagemDeErro = String

    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoSalvarPressionado(_ sender: UIButton) {
        switch camposSaoValidos() {
        case (false, let mensagemDeErro):
            exibeAlerta(titulo: "Erro", mensagem: mensagemDeErro)
            
        case (true, let mensagemSucesso):
            cadastraAutor()
            exibeAlerta(titulo: "Feito", mensagem: mensagemSucesso)
        }
    }
    
    func camposSaoValidos() -> (Bool, MensagemDeErro) {
        guard let foto = fotoTextField.text, !foto.isEmpty else {
            return (false, "Informe a URI da foto de autor")
        }

        guard let nome = nomeTextField.text, !nome.isEmpty else {
            return (false, "Nome não pode estar em branco.")
        }

        guard nomeDeAutorValido(nome) else {
            return (false, "Nome de autor inválido.")
        }

        guard let bio = bioTextField.text, !bio.isEmpty else {
            return (false, "A bio de autor não pode estar em branco.")
        }

        guard let tecnologias = tecnologiasTextField.text, !tecnologias.isEmpty else {
            return (false, "Informe as tecnologias sobre as quais o autor escreve")
        }
        
        return (true, "Autor cadastrado com sucesso")
    }
    
    func exibeAlerta(titulo: String, mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))

        present(alert, animated: true)
    }
    
    func cadastraAutor() {
            let (nome, sobrenome) = formata(nomeDeAutor: nomeTextField.text!)
            
            let autor = Autor(
                fotoURI: fotoTextField.text!,
                nome: nome,
                sobrenome: sobrenome,
                bio: bioTextField.text!,
                tecnologias: tecnologiasTextField.text!)
            
            AutorRepository.salva(autor)
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
