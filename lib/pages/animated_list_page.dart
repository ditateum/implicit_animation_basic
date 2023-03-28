import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({
    super.key,
  });

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final List<int> items = [26, 45];

  /*
      AnimatedListState adalah class State yang menaungi widget AnimatedList
      layaknya seperti controller sebuah list, AnimatedListState bertanggung jawab
      dalam menjalakan animasi pada AnimatedList.

      Kita dapat memanfaatkan insertItem dan removeItem
  */
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return MyItem(
            item: items[index],
            animation: animation,
            onDelete: () {
              final item = items.removeAt(index);

              listKey.currentState?.removeItem(
                index,
                (_, animation) => MyItem(
                  item: item,
                  animation: animation,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final randNumber = Random().nextInt(100);
          const index = 0;
          items.insert(index, randNumber);
          listKey.currentState?.insertItem(index);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  const MyItem({
    Key? key,
    required this.item,
    required this.animation,
    this.onDelete,
  }) : super(key: key);

  final int item;
  final Animation<double> animation;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Card(
        color: Colors.primaries[item % Colors.primaries.length],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Number $item',
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => onDelete!(),
                icon: const Icon(Icons.delete),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
