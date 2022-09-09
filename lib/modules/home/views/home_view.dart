import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/modules/todo/views/todo_view.dart';

final btmNavBarStateProvider = StateProvider((ref) => 0);

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  final pageController = PageController();

  @override
  Widget build(context, ref) {
    final btmNavCurrentIndex = ref.watch(btmNavBarStateProvider.state).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text('Counter')),
          Center(child: TodoView()),
          Center(child: Text('Search')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: btmNavCurrentIndex,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
          ref.read(btmNavBarStateProvider.state).state = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'Count'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
