import 'package:flutter/material.dart';
import 'package:mobile_modelo_1/src/widgets/carrossel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final carroseelKey = GlobalKey();

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
                children: [const Icon(Icons.menu, size: 30), IconButton(onPressed: () => print('clicas'), icon: const Icon(Icons.search))],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Whiskys',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            Carrossel(
              key: carroseelKey,
              currentIndex: 1,
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
                CarrosselItem("Vinhos"),
                CarrosselItem("Vinhos"),
                CarrosselItem("Vinhos"),
                CarrosselItem("Vinhos"),
                CarrosselItem("Vinhos"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
