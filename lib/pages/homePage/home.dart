import 'package:flutter/material.dart';
import 'package:pokedex/pages/homePage/widgets.dart';
import 'package:pokedex/pages/homePage/api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PokemonCard> list = [] ;
  int pageNum = 0 ;
  bool _loading = true ;
  bool isBottom = false;
  bool _firstLoad = true ;
  
  final ScrollController _controller = ScrollController();

    void _getCards() async {
    PokemonData pokemonData = PokemonData();
    List<PokemonCard> pokemonList = await pokemonData.fetchPokemon(pageNum);
    setState(() {
      if(pokemonList.isNotEmpty){
        list.addAll(pokemonList);
        pageNum++ ;
        _loading = false ;
        _firstLoad= false ;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getCards();

    _controller.addListener((){
        if(!_loading){
          // reached bottom
          if (_controller.offset >= _controller.position.maxScrollExtent &&
            !_controller.position.outOfRange) {
              setState(() => isBottom = true);
              print('Bottom');
              _loading = true ;
              _getCards();
          }
        }
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
      ),

      backgroundColor: Colors.white,

      body: Center(
        child: _firstLoad ? Image.asset('assets/images/pokeball.png', scale: 4.0,)
        : Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: GridView.count(
            controller: _controller,
            padding: const EdgeInsets.only(top: 4, bottom: 32),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            // List of subjects
            children: list,
          ),
        ),
      ),

    );
  }
}
