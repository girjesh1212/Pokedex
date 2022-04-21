import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/pages/detailsPage/detail.dart';
import 'package:pokedex/routes.dart';


class PokemonCard extends StatelessWidget {

  final String id ;
  final String name ;
  final String image ;
  final String height ;
  final String weight ;
  var abilities = [];
  var type = [] ;


  PokemonCard({
    Key? key, 
    required this.name, 
    required this.image, 
    required this.id, 
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(card: this)),
        )
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 20,
                color: const Color(0xFF17181C).withOpacity(0.5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: SvgPicture.network(image),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Text(name,
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Color(0xFF232730),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
