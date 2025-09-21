import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/features/favourite/presentation/favourite_movies_page.dart';
import 'package:movies/features/popular/presentation/popular_movies_page.dart';

import 'generated/l10n.dart';

enum NavigationTab {
  popular(unselectedIcon: Icons.movie_outlined, selectedIcon: Icons.movie),
  favourites(
    unselectedIcon: Icons.favorite_outline,
    selectedIcon: Icons.favorite,
  );

  const NavigationTab({
    required this.unselectedIcon,
    required this.selectedIcon,
  });

  final IconData unselectedIcon;
  final IconData selectedIcon;

  String get label => switch (this) {
    NavigationTab.popular => S.current.popular,
    NavigationTab.favourites => S.current.favourites,
  };
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PopularMoviesPage(),
    FavouriteMoviesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      HapticFeedback.mediumImpact();
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showUnselectedLabels: false,
        elevation: 8,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: NavigationTab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.unselectedIcon),
            activeIcon: Icon(tab.selectedIcon),
            label: tab.label,
            tooltip: tab.label,
          );
        }).toList(),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}
