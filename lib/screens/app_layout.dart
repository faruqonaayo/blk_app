import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:blk_app/widgets/add_options.dart';
import 'package:blk_app/screens/home_screen.dart';
import 'package:blk_app/widgets/app_mode_button.dart';
import 'package:go_router/go_router.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  State<AppLayout> createState() {
    return _AppLayoutState();
  }
}

class _AppLayoutState extends State<AppLayout> {
  late int _currentPage;

  final _pages = const [
    HomeScreen(),
    Center(child: Text("Categories")),
    Center(child: Text("Add")),
    Center(child: Text("Favorites")),
    Center(child: Text("Settings")),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          AppModeButton(),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) {
                return;
              }
              context.go("/auth");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surfaceContainerLow,
        unselectedItemColor: colorScheme.secondary,
        selectedItemColor: colorScheme.primary,
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.add, color: colorScheme.onPrimary),
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (value) async {
          // Tapping on the add icon in the navigation bar acts differently by displaying a modal bottom sheet with options
          if (value == 2) {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => const SizedBox(
                height: 160,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AddOptions(),
                ),
              ),
            );
            return;
          }
          setState(() {
            _currentPage = value;
          });
        },
      ),
    );
  }
}
