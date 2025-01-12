import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            bottomNavigationBar: const TabBar(tabs: [
              Text('Status'),
              Text('System logs'),
              Text('Notification history'),
              Text('Options')
            ]),
            body: TabBarView(
              children: [
                Center(
                  child: Text('Status'),
                ),
                Center(
                  child: Text('System logs'),
                ),
                Center(
                  child: Text('Notification history'),
                ),
                Center(child: Text('Options')),
              ],
            )));
  }
}
