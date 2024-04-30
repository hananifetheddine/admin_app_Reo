import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  
  const InputComponent(
      {super.key,
      required this.controller,
      this.type = TextInputType.text,
      required this.onSubmit,
      required this.onChange,
      required this.validate,
      this.showSuffixButton = false,
      });

  final TextEditingController controller;
  final TextInputType type;
  final void Function(String?) onSubmit;
  final Function(String?) onChange;
  final String? Function(String?) validate;
  final bool showSuffixButton;

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  var obs = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        keyboardType: widget.type,
        onFieldSubmitted: widget.onSubmit,
        onChanged: widget.onChange,
        validator: widget.validate,
        obscureText: obs,
        
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.black),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),


          suffixIcon: widget.showSuffixButton
              ? IconButton(
                  icon: Icon(
                    obs
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ), 
                  onPressed: () {
                    setState(() {
                      obs=!obs;
                    });
                  },
                )
              : null, 
        
        ),
      );
  }
}
