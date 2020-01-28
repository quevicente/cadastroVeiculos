//
//  Opcionais.swift
//  cadastroVeiculo
//
//  Created by Vicente Patricio on 27/01/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class Opcionais: NSObject {
    
    var lista: [String] = []
    
    func adicionaOpcionais(_ valor: String){
        self.lista.append(valor)
    }
}
