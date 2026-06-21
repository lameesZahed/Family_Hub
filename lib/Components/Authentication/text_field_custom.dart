import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String? name;
  final String hint;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  bool? secure;
  final VoidCallback? onTap;
  final FloatingLabelBehavior labelBehavior;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
   TextFieldCustom({super.key, this.name, required this.labelBehavior,required this.controller, required this.hint, this.secure, required this.focusNode, this.nextFocusNode, this.keyboardType, this.onChanged, this.onTap});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool eye = false;
  late bool hidePassword;

  @override
  void initState() {
    hidePassword = widget.secure??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        obscureText: hidePassword,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onFieldSubmitted: (value){
          if(widget.nextFocusNode!=null && value.isNotEmpty){
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
          else{
            widget.focusNode.unfocus();
          }
          },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.labelBehavior,
          labelText: widget.name,
          hintText: widget.hint,
          suffixIcon:(widget.secure??false)?IconButton(
              onPressed: (){
                setState(() {
                  eye = !eye;
                 hidePassword = !hidePassword;
                });
              },
              icon: Icon((eye)?Icons.visibility_outlined:Icons.visibility_off_outlined,color: Color(0xff016B61),)):
              null

        ),
      ),
    );
  }
}
