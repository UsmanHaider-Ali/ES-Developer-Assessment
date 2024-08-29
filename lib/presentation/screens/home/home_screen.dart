import 'package:es_developer_assessment/presentation/pages/home/movies_page.dart';
import 'package:es_developer_assessment/presentation/pages/home/offers_page.dart';
import 'package:es_developer_assessment/presentation/pages/home/saved_movies_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

   final List<Widget> _widgetOptions = <Widget>[const MoviesPage(), const OffersPage(), const SavedMoviesPage()];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ES Movies'),
        actions: [IconButton(icon: const Icon(Icons.notifications_none_outlined), onPressed: () {})],
      ),
      drawer: const Drawer(child: Center(child: Text("Coming Soon..."))),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saved'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
