//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Cristian Bahamondes on 27-08-22.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State private var isShared = false
    
    @EnvironmentObject var vm:ViewModel
    let pokemon:Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0 )) KG")
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0 )) M")
            }
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
        
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
