import 'package:family_hub/Components/Customized%20Buttons/two_elements_button.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class AiRecipeGenerator extends StatelessWidget {
  const AiRecipeGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "AI recipe generator"),
      endDrawer: MainDrawer(),
      body: aiBody(context),
    );
  }
  
  
  Widget aiBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add ingredients",style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 20,
                fontWeight: FontWeight.normal
              ),),
              SizedBox(height: 8,),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Write the available ingredients to generate a recipe for you ....",
                )
              ),
              SizedBox(height: 24,),
              TwoElementsButton(
                onPressed: (){
                  Navigator.pushNamed(context, "Recipe Generated");
                },
                first: Text("Generate recipe"),
                second: Icon(Icons.auto_awesome)
              ),
            ],
          ),
        ),
      ),
    );
  }







}
