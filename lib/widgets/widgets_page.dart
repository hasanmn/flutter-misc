import 'package:flutter/material.dart';
import 'package:misctech/widgets/container.dart';
import 'package:misctech/widgets/lazy_loading_list_view.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContainerPage(),
                    ),
                  );
                },
                child: const Text('Containter'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LazyLoadingListView(),
                    ),
                  );
                },
                child: const Text('LazyLoadingListView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
