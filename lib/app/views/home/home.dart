import 'package:flutter/material.dart';

import 'widgets/bottom_boxes_view.dart';
import 'widgets/chart_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final size = height > width ? height : width;
    return Container(
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(bottom: 30),
            height: size * 0.43,
            child: const Card(
              child: Center(
                child: MiPieChart(),
              ),
            ),
          ),
          const BottomBoxesView(),
        ],
      ),
    );
  }
}
