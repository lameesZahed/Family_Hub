import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class FamilyTree extends StatelessWidget {
  const FamilyTree({super.key});

  // final Graph graph = Graph()..isDirected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Family Tree"),
      endDrawer: MainDrawer(),
      body: FamilyTreeBody(),
    );
  }




  Widget FamilyTreeBody(){
    return InteractiveViewer(
        child: GraphView(
            graph: Graph()..isTree = true,
            algorithm: BuchheimWalkerAlgorithm(
              BuchheimWalkerConfiguration(
              ),
                TreeEdgeRenderer(
                  BuchheimWalkerConfiguration()
                )
            ),
            builder: (Node node){
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(node.key.toString()),
              );
            }
        )
    );
  }
}
