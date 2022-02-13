import 'package:flutter/material.dart';

class LazyLoadingListView extends StatefulWidget {
  const LazyLoadingListView({Key? key}) : super(key: key);

  @override
  State<LazyLoadingListView> createState() => _LazyLoadingListViewState();
}

class _LazyLoadingListViewState extends State<LazyLoadingListView> {
  List<String> items = [];
  bool loading = false;
  bool allLoaded = false;
  final ScrollController _scrollController = ScrollController();

  mockFetch() async {
    if (allLoaded) {
      return true;
    }

    setState(() {
      loading = true;
    });

    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    List<String> newData = items.length >= 60
        ? []
        : List.generate(15, (index) => "List item ${index + items.length}");
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }

    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy scroll loading'),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          if (items.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                ListView.separated(
                  controller: _scrollController,
                  itemBuilder: ((context, index) {
                    if (index < items.length) {
                      return ListTile(
                        title: Text(items[index]),
                      );
                    } else {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: 50,
                        child: const Center(
                          child: Text('Nothing more to load...'),
                        ),
                      );
                    }
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                  itemCount: items.length + (allLoaded ? 1 : 0),
                ),
                if (loading) ...[
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: 80,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ]
              ],
            );
          }
        }),
      ),
    );
  }
}
