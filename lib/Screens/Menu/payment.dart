import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Menu/Drawer/main_drawer.dart';
import 'package:family_hub/Components/Menu/Payment/form_component.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Payment"),
      drawer: MainDrawer(),
      body: PaymentBody(),

    );
  }


  Widget PaymentBody(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: SingleChildScrollView(
        child: Form(
          child: Column( 
            children: [
              FormComponent(title: "Card Number", hint: "1234  5678  9101  1121"),
              Row(
                children: [
                  Expanded(child: FormComponent(title: "Expiration Date", hint: "MM/YY")),
                  Expanded(child: FormComponent(title: "CVV", hint: "123")),
                ],
              ),
              SizedBox(height: 84,),
              Button(text: "Pay USD 59.28", onPressed: (){}),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Your personal data will be used to"
                    " process your order, support your experience "
                    "throughout this website, and for other purposes "
                    "described in our privacy policy.",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6E5C52)
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
