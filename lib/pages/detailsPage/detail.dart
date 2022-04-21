import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/pages/homePage/widgets.dart';

class DetailScreen extends StatefulWidget {

  final PokemonCard card ;

  const DetailScreen({Key? key, 
    required this.card
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  List<Chip> typeList = [] ;
  List<Chip> abilityList = [] ;
  bool _loading = true ;


  void _buildChips() {
    
    for (var e in widget.card.type) {
      typeList.add(
        Chip(
          padding: const EdgeInsets.all(8), 
          label: Text(e, 
            style: TextStyle(color: Colors.white),
          ), 
          backgroundColor: Colors.blue,
          ),
        );
    }

    for (var e in widget.card.abilities) {
      abilityList.add(
        Chip(
          padding: const EdgeInsets.all(8), 
          label: Text(e, 
            style: TextStyle(color: Colors.white),
          ), 
          backgroundColor: Colors.green,
          ),
      );
    }

    setState(() {
      _loading = false ;
    });
  }

    @override
  void initState() {
    super.initState();
    _buildChips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
      ),

      backgroundColor: Colors.white,

      body: _loading ? const Center(child: Text('Loading')) 
      : Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 1,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20.0,
                                spreadRadius: 0.0,
                              ),
                            ]
                          ),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: 0.7,
                                widthFactor: 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Text(widget.card.name, 
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Height: ${widget.card.height}'),
                                        const SizedBox(width: 12),
                                        const Text('|'),
                                        const SizedBox(width: 12),
                                        Text('Weight: ${widget.card.weight}'),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Type', style: TextStyle(fontWeight: FontWeight.bold),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: typeList
                                        ),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Abilities', style: TextStyle(fontWeight: FontWeight.bold),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: abilityList
                                        ),
                                      ],
                                    ),



                                  ],
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.4,
                        widthFactor: 1,
                        child: SvgPicture.network(
                          widget.card.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Expanded(
                flex: 4  ,
                child: Container(

                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
