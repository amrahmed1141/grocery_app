import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Icon(Icons.star,size: 12,color: Colors.yellow,),
      Icon(Icons.star,size: 12,color: Colors.yellow,),
      Icon(Icons.star,size: 12,color: Colors.yellow,),
      Icon(Icons.star,size: 12,color: Colors.yellow,),
       Icon(Icons.star,size: 12,color: Colors.black,),
    ],);
  }
}