import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidupPanel extends StatelessWidget {
  static const routeName = '/splitup';
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: Center(
        child: Text('Hello'),
      ),
      body: Text('body od slidinfgUpPanel!!'),
    );
  }
}
