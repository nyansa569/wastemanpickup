import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import './screens.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen({super.key, this.currentIndex = 1});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentIndex = 0;
  final screens = const [
    DynamicMaps(),
    OrdersPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: widget.currentIndex == 1
            ? null
            : CupertinoNavigationBar(
                middle: widget.currentIndex == 0
                    ? const Text("Maps")
                    : widget.currentIndex == 1
                        ? null
                        : const Text('Account'),
                leading: const SizedBox(),
              ),
      ),
      material: (_, __) => MaterialScaffoldData(
        appBar: AppBar(
          title: widget.currentIndex == 0
              ? const Text("News feed")
              : widget.currentIndex == 1
                  ? const Text("Search")
                  : widget.currentIndex == 2
                      ? const Text("Notification")
                      : const Text("Accounts"),
          actions: [
            widget.currentIndex == 3
                ? PlatformIconButton(
                    onPressed: () {},
                    icon: Icon(
                      PlatformIcons(context).settings,
                      color: Colors.white,
                    ),
                  )
                : widget.currentIndex == 0
                    ? PlatformIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.globe,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
          ],
        ),
        body: IndexedStack(
          index: widget.currentIndex,
          children: screens,
        ),
      ),
      bottomNavBar: PlatformNavBar(
        currentIndex: widget.currentIndex,
        itemChanged: (value) => setState(() => widget.currentIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).home,
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     PlatformIcons(context).search,
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).dehaze,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).person,
            ),
          ),
        ],
        material: (_, __) => MaterialNavBarData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          itemChanged: (value) => setState(() => widget.currentIndex = value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
