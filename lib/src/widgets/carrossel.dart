import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Carrossel extends StatelessWidget {
  const Carrossel({
    super.key,
    required this.childrens,
    required this.currentIndex,
    required this.onChanged,
  });

  final List<CarrosselItem> childrens;
  final int currentIndex;
  final void Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: childrens
            .mapIndexed(
              (index, e) => InkWell(
                onTap: () => onChanged(index),
                child: _CarrosselItem(
                  title: e.title,
                  selected: index == currentIndex,
                ),
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
    required this.title,
    required this.selected,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : null,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: selected ? 30 : 0,
            curve: Curves.decelerate,
            height: 3,
            color: const Color(0xFFFCEB67),
          ),
        ],
      ),
    );
  }
}
