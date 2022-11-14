//
//  Autor.swift
//  LearningTask-5.4
//
//  Created by Raul Ribeiro on 14/11/22.
//

import Foundation

struct Autor {
    var fotoURI: String
    var nome: String
    var sobrenome: String
    var bio: String
    var tecnologias: String
    
    init(fotoURI: String, nome: String, sobrenome: String, bio: String, tecnologias: String) {
        self.fotoURI = fotoURI
        self.nome = nome
        self.sobrenome = sobrenome
        self.bio = bio
        self.tecnologias = tecnologias
    }
    
}
