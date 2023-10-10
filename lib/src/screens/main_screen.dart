import 'package:flutter/material.dart';
import 'package:mobile_modelo_1/src/widgets/card_carrossel.dart';
import 'package:mobile_modelo_1/src/widgets/carrossel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _carroseelKey = GlobalKey();
  var _whiskysCurrentIndex = 0;

  void _changeWhiskysCurrentIndex(int index) {
    setState(() {
      _whiskysCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Material(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: mediaQuery.padding.top),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 30),
                  IconButton(
                      onPressed: () => print('clicas'),
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Whiskys',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Carrossel(
                key: _carroseelKey,
                currentIndex: _whiskysCurrentIndex,
                onChanged: _changeWhiskysCurrentIndex,
                childrens: const [
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                  CarrosselItem("Vinhos"),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: CardCarrossel(
                  image:
                      'https://www.bebidasfamosas.com.br/wp-content/uploads/2019/10/whisky-johnnie-walker-red-label-1l.jpg',
                  rating: 4.5,
                  title: 'Whisky Johnnie Walker Red Label 1L',
                  price: 79.90,
                )),
          ],
        ),
      ),
    );
  }
}
