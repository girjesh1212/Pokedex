import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/pages/homePage/widgets.dart';


class PokemonData{

  List<PokemonCard> list = [] ;
  Future<List<PokemonCard>> fetchPokemon(int pageNum) async {
      // GET request
      const baseUrl = 'https://pokeapi.co/api/v2/pokemon/' ;

      for(var i= pageNum*16 + 1 ; i <= (pageNum+1)*16 ; i++){
        http.Response response = await http.get(
          Uri.parse('$baseUrl/$i'),
        );

        // Handling response
        if(response.statusCode == 200){
          // Decode data
          final res = jsonDecode(response.body);

          String id = res['id'].toString();
          String name = res['name'].toString();
          name = "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}" ;
          String image = res['sprites']['other']['dream_world']['front_default'].toString();
          String height = res['height'].toString();
          String weight = res['weight'].toString();

          PokemonCard card = PokemonCard(name: name, image: image, id: id, height: height, weight: weight) ;

          var types = res['types'] ;
          types.forEach((element){
            card.type.add(element['type']['name']);
          });

          var ability = res['abilities'] ;
          ability.forEach((e) {
            card.abilities.add(e['ability']['name']);
          });
          list.add(card);
          // print('adding card $i');

        } // if
      } // loop

      return list;
    }


}
    

