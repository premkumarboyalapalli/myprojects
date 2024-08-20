import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetbulksmsservices/side_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Dashboard Menu'),
      ),
      body: Center(
        child: Text('Side Menu example'),
      ),
    );
  }
}
