import 'package:flutter/material.dart';
import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';

// ignore: must_be_immutable
class CustomNavigationRail extends StatefulWidget {
  final List<IconData> listaIcones;
  final List<String> listaLabels;
  final List<Widget> pages;
  final Function(int index)? changeDestination;
  int currentIndex;

  CustomNavigationRail({
    super.key,
    required this.currentIndex,
    required this.listaIcones,
    required this.listaLabels,
    required this.pages,
    required this.changeDestination,
  });

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  List<NavigationRailDestination> destinations = [];

  @override
  void initState() {
    super.initState();
    navigationRailDinamica();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Row(
        children: <Widget>[
          NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: context.tertiaryColor,
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: NavigationRail(
              selectedIndex: widget.currentIndex,
              onDestinationSelected: widget.changeDestination,
              useIndicator: true,
              indicatorShape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(100), // faz virar um círculo
              ),
            
              minWidth: 100,
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              selectedLabelTextStyle: TextStyle(color: context.tertiaryColor),
              unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
              elevation: 5,
              // indicatorShape: const CircleBorder(

              // ),
              // useIndicator: true,
              // backgroundColor: Colors.grey[50],
              indicatorColor: context.tertiaryColor,
              destinations: destinations,
            ),
          ),
          // This is the main content.
          Expanded(
            child: widget.pages[widget.currentIndex],
          ),
        ],
      ),
    );
  }

  navigationRailDinamica() {
    for (int i = 0; i < widget.listaIcones.length; i++) {
      destinations.add(
        NavigationRailDestination(
          padding: const EdgeInsets.all(12),
          icon: Icon(widget.listaIcones[i], size: 25),
          selectedIcon: Icon(
            widget.listaIcones[i],
            color: Colors.black,
            size: 25,
          ),
          label: Text(widget.listaLabels[i]),
        ),
      );
    }
  }
}
