//
//  VeiculosCadastradosTableViewController.swift
//  cadastroVeiculo
//
//  Created by Vicente Patricio on 27/01/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class VeiculosCadastradosTableViewController: UITableViewController, VeiculosCadastradosDelegate {
    
    // MARK: - Atributos
    
    var listaVeiculos: [Veiculo] = []

    // MARK: - Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return listaVeiculos.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = "\(listaVeiculos[indexPath.row].marca) - \(listaVeiculos[indexPath.row].modelo)"

        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(detalhes))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    @objc func detalhes(_ gesture: UIGestureRecognizer){
        
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let posicao = tableView.indexPath(for: celula) else { return }
            
            let mensagem = "Ano modelo: \(listaVeiculos[posicao.row].anoModelo) Quilometragem: \(listaVeiculos[posicao.row].quilometragem)"
            
            let alerta = UIAlertController(title: listaVeiculos[posicao.row].modelo, message: mensagem, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
    }
    
    func adicionarTabela(_ veiculo: Veiculo){
        listaVeiculos.append(veiculo)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? CadastrarVeiculosViewController {
                viewController.delegate = self

            }
        }
    }
}
