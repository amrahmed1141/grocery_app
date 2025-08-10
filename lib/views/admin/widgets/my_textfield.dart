import 'package:flutter/material.dart';
import 'package:eshop_app/utils/constant.dart';

class MyTextfield extends StatefulWidget {
  const MyTextfield(
      {super.key,
      required this.text,
      this.controller,
      required this.obscureText, 
      this.icons,
      this.validator});

  final String text;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? icons;
  final String? Function(String?)? validator;
  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.deepPurple),
            hintText: widget.text,
            prefixIcon: widget.icons,
            fillColor: Colors.grey.shade100,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(color: Colors.deepPurple))),
      ),
    );
  }
}
