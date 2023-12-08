import 'package:flutter/material.dart';
import 'package:flutter_three_challenge/core/constants.dart';
import 'package:flutter_three_challenge/pages/home.dart';
import 'package:flutter_three_challenge/pages/profile.dart';
import 'package:provider/provider.dart';

import '../core/providers/character_movin_provider.dart';
import 'timer.dart';

class PageViewContainer extends StatefulWidget {
  const PageViewContainer({super.key});

  @override
  State<PageViewContainer> createState() => _PageViewContainerState();
}

class _PageViewContainerState extends State<PageViewContainer> {
  final List screens = [const Home(), const Timer(), const Profile()];

  late final PageController _pageController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return screens[index];
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: scaffoldBackgroundColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.auto_graph_outlined),
            label: 'Page 1',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time),
            label: 'Page 2',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Page 3',
          ),
        ],
        onDestinationSelected: _changePage,
      ),
    );
  }

  void _changePage(int index) {
    Provider.of<CharacterMovinProvider>(context, listen: false)
              .reverseOrbitAnimation();
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: (index - _selectedIndex).abs() * 2000),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
