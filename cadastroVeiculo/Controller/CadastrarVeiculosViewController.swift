//
//  CadastrarVeiculosViewController.swift
//  cadastroVeiculo
//
//  Created by Vicente Patricio on 27/01/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

protocol VeiculosCadastradosDelegate {
    func adicionarTabela(_ veiculo: Veiculo)
}

class CadastrarVeiculosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let listaOpcionais: [String] = ["Ar quente", "Ar condicionado"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return listaOpcionais.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = listaOpcionais[indexPath.row]
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType != .checkmark {
            
            celula.accessoryType = .checkmark
        } else {
            celula.accessoryType = .none
        }
    }
    
    
    var delegate: VeiculosCadastradosDelegate?
    var veiculo = Veiculo(marca: "Fiat", modelo: "Teste", anoModelo: 2007)
    
    // MARK: - Outlets
    
    @IBOutlet weak var marcaTextField: UITextField!
    @IBOutlet weak var modeloTextField: UITextField!
    @IBOutlet weak var anoModeloTextField: UITextField!
    @IBOutlet weak var quilometragemTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func adicionarButton(_ sender: Any) {
        let auxiliar: Veiculo
        
        guard let marcaGuard = marcaTextField.text else {return}
        guard let modeloGuard = modeloTextField.text else {return}
        guard let anoModeloGuard = anoModeloTextField.text else {return}
        guard let quilometragemGuard = quilometragemTextField.text else {return}
        
        if let anoMesmo = Int(anoModeloGuard) {
            if let quiloMesmo = Double(quilometragemGuard) {
                auxiliar = Veiculo(marca: marcaGuard, modelo: modeloGuard, anoModelo: anoMesmo, quiloMesmo)
                delegate?.adicionarTabela(auxiliar)
                navigationController?.popViewController(animated: true)
            }else{
                auxiliar = Veiculo(marca: marcaGuard, modelo: modeloGuard, anoModelo: anoMesmo)
                delegate?.adicionarTabela(auxiliar)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
