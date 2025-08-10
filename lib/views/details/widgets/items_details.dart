import 'package:flutter/material.dart';
import 'package:eshop_app/utils/constant.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color:const Color(0xffF2F3F2)),borderRadius: BorderRadius.circular(15)),
                    child: Row(
                    children: [
                      Image.asset('assets/grocery/Group.png',height: 50,width: 50,),
                      const SizedBox(width: 5,),
                      const Column(children: [
                        Text('100%',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                        Text('Organic',style: TextStyle(color: Color(0xff979899) ,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],)
                    ],
                  ),),
                   Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color:const Color(0xffF2F3F2)),borderRadius: BorderRadius.circular(15)),
                    child: Row(
                    children: [
                      Image.asset('assets/grocery/calendar.png',height: 50,width: 50,),
                      const SizedBox(width: 5,),
                      const Column(children: [
                        Text('1 Year',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                        Text('Expiration',style: TextStyle(color: Color(0xff979899) ,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],)
                    ],
                  ),)
               
              ],),
              const SizedBox(height: 10,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color:const Color(0xffF2F3F2)),borderRadius: BorderRadius.circular(15)),
                    child: Row(
                    children: [
                      Image.asset('assets/grocery/favourites.png',height: 50,width: 50,),
                      const SizedBox(width: 5,),
                      const Column(children: [
                        Text('4.8',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                        Text('Reviews',style: TextStyle(color: Color(0xff979899) ,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],)
                    ],
                  ),),
                   Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color:const Color(0xffF2F3F2)),borderRadius: BorderRadius.circular(15)),
                    child: Row(
                    children: [
                      Image.asset('assets/grocery/matches 1.png',height: 50,width: 50,),
                      const SizedBox(width: 5,),
                      const Column(children: [
                        Text('80 kcal',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                        Text('100 Gram',style: TextStyle(color: Color(0xff979899) ,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],)
                    ],
                  ),)
               
              ],)
      ],
    );
  }
}
