import 'dart:io';

import 'package:bottom_indicator_bar_svg/bottom_indicator_bar_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/ui/dashboard/calculate_view.dart';
import 'package:flutter_application_1/src/ui/dashboard/shipment_history_view.dart';
import 'package:flutter_application_1/src/ui/home/home_page_view.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
     {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    HomepageView(),
   CalculateView(),
    ShipmentHistoryView(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.deepPurple[600]!,
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.deepPurple[600]!,
        ),
        body:_widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomIndicatorBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomIndicatorNavigationBarItem>[
            BottomIndicatorNavigationBarItem(icon: Icons.home_outlined, label: Text('Home')),
            BottomIndicatorNavigationBarItem(icon: Icons.calculate_outlined, label: 'Calculate'),
            BottomIndicatorNavigationBarItem(icon: Icons.restore,label: 'Shipment'),
            BottomIndicatorNavigationBarItem(icon: Icons.person_2_outlined,label: 'Profile')
          ],
          iconSize: 25.0,
          indicatorHeight: 4, // Set to 0 to hide the indicator bar
          activeColor: Colors.deepPurple[800]!,
          inactiveColor: Colors.grey,
          indicatorColor: Colors.deepPurple[800]!,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}
