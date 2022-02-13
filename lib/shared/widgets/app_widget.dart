import 'package:flutter/material.dart';
import 'package:misctech/event-app/pages/home_page.dart';
import 'package:misctech/neumorphism/neumorphism_page.dart';
import 'package:misctech/widgets/widgets_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NeumorphismPage(),
                        ),
                      );
                    },
                    child: const Text('Neumorphism Page'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text('Event-App'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WidgetsPage(),
                        ),
                      );
                    },
                    child: const Text('About widgets'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
