import 'package:flutter/material.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
    );
  }
}

_buildAppBar() {
  return AppBar(
    title: const Text(
      'Daily News!',
      style: TextStyle(color: Colors.black),
    ),
  );
}
