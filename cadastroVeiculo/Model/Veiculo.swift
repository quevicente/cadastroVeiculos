//
//  Veiculo.swift
//  cadastroVeiculo
//
//  Created by Vicente Patricio on 27/01/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class Veiculo: NSObject {
    
    let marca: String
    let modelo: String
    let anoModelo: Int
    let quilometragem: Double
    let listaOpcionais: [Opcionais] = []
    
    init(marca: String, modelo: String, anoModelo: Int, _ quilometragem: Double = 0) {
        self.marca = marca
        self.modelo = modelo
        self.anoModelo = anoModelo
        self.quilometragem = quilometragem
    }

}
