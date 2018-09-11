//
//  PokeSearchViewController.swift
//  PokeDexC
//
//  Created by Cody on 9/11/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class PokeSearchViewController: UIViewController {

    //IB
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: CRAPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
    func updateViews(){
        guard let pokemon = pokemon else {return}
        pokeSearchBar.text = ""
        nameLabel.text = "Name: \(pokemon.name.capitalized)"
        idLabel.text = "ID: \(pokemon.identifier)"
        abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", ").capitalized)"
    }
    
}

extension PokeSearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let pokemonText = searchBar.text?.lowercased() else {return}
        CRAPokemonController.fetchPokemon(forSearchTerm: pokemonText, completion: { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            }
        })
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        CRAPokemonController.fetchPokemon(forSearchTerm: searchText, completion: { (pokemon) in
//            self.pokemon = pokemon
//            DispatchQueue.main.sync {
//                self.updateViews()
//            }
//            })
//    }
    
}
