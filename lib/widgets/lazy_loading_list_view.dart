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
        milliseconds: 1000,
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
            return ListView.separated(
              controller: _scrollController,
              itemBuilder: ((context, index) {
                if (index < items.length) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                } else {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: 60,
                    child: Center(
                      child: allLoaded
                          ? const Text('Nothing more to load...')
                          : const CircularProgressIndicator(),
                    ),
                  );
                }
              }),
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                );
              },
              itemCount: items.length + ((loading || allLoaded) ? 1 : 0),
            );
          }
        }),
      ),
    );
  }
}
