import 'package:family_hub/Screens/Authentication/Register/login.dart';

import 'package:flutter/material.dart';

import 'Sign Up/signup_1.dart';
import 'Sign Up/signup_2.dart';
import 'Sign Up/signup_3.dart';
import 'Sign Up/signup_flow.dart';

class Register extends StatefulWidget {
  int index; //0 login , 1 signup
  Register({super.key,required this.index});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late int index ;

  @override
  void initState() {
    index = widget.index;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child:Column(
              children: [
                Image.asset("assets/Images/Placeholder Circle.png",height: 150,width: 150,fit: BoxFit.fill,),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (index==0)?Color(0xFF9B4747):Colors.transparent,
                                  width: 1.5
                              )
                          )
                      ),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Text("Log in",style: TextStyle(
                            color: (index==0)?Color(0xFF9B4747):Color(0xFF9B4747).withOpacity(0.6),
                            fontSize: 16
                          ),)
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: (index==1 || index==2 || index==3)?Color(0xFF9B4747):Colors.transparent,
                                width: 1.5
                          )
                        )
                      ),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Text("Sign up",style: TextStyle(
                            color: (index==1 || index==2 || index==3)?Color(0xFF9B4747):Color(0xFF9B4747).withOpacity(0.6),
                            fontSize: 16
                          ),)
                      ),
                    )
                  ],
                ),
                switch(index){
                0=>Login(onTap: (value){setState(() {index = value;});}),
                1=>SignupFlow(),
                _=>Container(),
                }
                // (index==1)? Signup1(
                //   onTap: (value){
                //     setState(() {
                //       index = value;
                //     });
                //   },
                // ):Login(
                //   onTap: (value){
                //     setState(() {
                //       index = value;
                //     });
                //   },
                // ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
