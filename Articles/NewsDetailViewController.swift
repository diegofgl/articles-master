//
//  NewsDetailViewController.swift
//  Articles
//
//  Created by Diego Rodrigues on 09/10/23.
//

import UIKit

class NewsDetailViewController: UIViewController {
    var selectedArticle: Articles?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Configurar o rótulo do título
        titleLabel.text = selectedArticle?.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0 // Permite várias linhas
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar o rótulo de descrição
        descriptionLabel.text = selectedArticle?.description
        descriptionLabel.numberOfLines = 0 // Permite várias linhas
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicionar rótulos à subview da tela de detalhes
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        // Configurar as restrições para os rótulos
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}


