import 'package:flutter/material.dart';

class Carrossel extends StatelessWidget {
  const Carrossel({
    super.key,
    required this.childrens,
    required this.currentIndex,
  });

  final List<CarrosselItem> childrens;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: childrens
            .map(
              (e) => _CarrosselItem(
                key: UniqueKey(),
                title: e.title,
                selected: childrens.indexOf(e) == 2,
              ),
            )
            .toList(),
      ),
    );
  }
}

class CarrosselItem {
  const CarrosselItem(this.title);
  final String title;
}

class _CarrosselItem extends StatelessWidget {
  const _CarrosselItem({
    super.key,
    required this.title,
    this.selected = false,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: ValueKey(selected),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Colors.red : Colors.white,
              width: 2,
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
