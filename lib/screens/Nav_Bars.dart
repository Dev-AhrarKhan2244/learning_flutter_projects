import 'package:bmi/screens/nav_bar_1_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBars extends StatefulWidget {
  const NavBars({super.key});
  @override
  State<NavBars> createState() => _NavBars();
}

// ignore: unused_element
class _NavBars extends State<NavBars> {
  bool isDark = false;
  late PersistentTabController _controller;
  final DarkKey = 'spKey';
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    getValue();
  }

  getValue() async {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      isDark = pref.getBool(DarkKey) ?? false;
    });
  }

  saveValue() async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(DarkKey, isDark);
  }

  List<Widget> _buildScreens() {
    return [
      Center(child: Text('Stats Page')),
      Center(child: Text('Tools Page')),
      FindNav(isDark: isDark),
      Center(child: Text("Network Page")),
      Center(child: Text("... Page")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.chartBar),
        title: ("Dashboard"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.tools),
        title: ("Tools"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.compass),
        title: ("Find"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.wifi),
        title: ("Network"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.boxArchive),
        title: ("More"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              IconButton.outlined(
                onPressed: () {},
                icon: const FaIcon(Icons.arrow_back),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Diary',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Text(
                        'Weekly ',
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton.outlined(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
                saveValue();
              },
              icon: FaIcon(isDark ? Icons.dark_mode : Icons.light_mode),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.downLong),
            ),
          ],
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style1, // <<< Style 1
          backgroundColor: isDark ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
