import 'dart:math';

import 'package:flutter/material.dart';

class DeathScreen extends StatefulWidget {
  final String username;
  const DeathScreen({Key? key, required this.username}) : super(key: key);

  @override
  _DeathScreenState createState() => _DeathScreenState();
}

class _DeathScreenState extends State<DeathScreen> {
  late int year;
  late int month;
  late int day;

  @override
  void initState() {
    super.initState();
    year = generateRandomNumber(1, 50);
    month = generateRandomNumber(1, 12);
    day = generateRandomNumber(1, 29);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
            color: Colors.grey.shade700,
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          widget.username,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'yaşamak için sadece,',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2),
              child: Row(
                children: [
                  Text(
                    ' $year ',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 54),
                  ),
                  Text(
                    ' yıl,',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2),
              child: Row(
                children: [
                  Text(
                    ' $month ',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 54),
                  ),
                  Text(
                    ' ay,',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2),
              child: Row(
                children: [
                  Text(
                    ' $day ',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 54),
                  ),
                  Text(
                    ' günün var..',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return random.nextInt(max - min + 1) + min;
  }
}
