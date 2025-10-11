import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:granio_flutter/app/core/ui/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:granio_flutter/app/models/logged_user_model.dart';
import 'package:granio_flutter/pages/history/history_page.dart';
import 'package:granio_flutter/pages/home/home_router.dart';

class BottomNavBarView extends StatefulWidget {
  final LoggedUserModel loggedUserModel;
  const BottomNavBarView({
    super.key,
    required this.loggedUserModel,
  });

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  List<Widget> pages = [];
  List<String> tittles = [
    'Home',
    'Search',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    pages = [
      HomeRouter(loggedUserModel: widget.loggedUserModel).page,
      HistoryPage(),
      Container(),
    ];
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(tittles[currentIndex]),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        listaIcons: [
          // ignore: deprecated_member_use
          FontAwesomeIcons.home,
          FontAwesomeIcons.magnifyingGlass,
          FontAwesomeIcons.user,
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: LazyIndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
