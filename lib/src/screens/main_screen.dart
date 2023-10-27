// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_modelo_1/src/constants/nota_constants.dart';
import 'package:mobile_modelo_1/src/data/bebida.dart';
import 'package:mobile_modelo_1/src/data/categoria.dart';
import 'package:mobile_modelo_1/src/mock/bebida_mock.dart';
import 'package:mobile_modelo_1/src/mock/categoria_mock.dart';
import 'package:mobile_modelo_1/src/screens/details_screen.dart';
import 'package:mobile_modelo_1/src/utils/bebida_utils.dart';
import 'package:mobile_modelo_1/src/widgets/carrossel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _carroseelKey = GlobalKey();
  var _whiskysCurrentIndex = 0;

  static const _BEBIDA_DESCRICAO_HEIGHT = 100.0;
  static const _BEBIDA_DESCRICAO_MARGIN_BOTTOM = 10.0;
  static const _BEBIDA_CONTAINER_SIZE = 200.0;

  double get _fractionSize => _BEBIDA_CONTAINER_SIZE * .888;

  void _changeWhiskysCurrentIndex(int index) {
    setState(() {
      _whiskysCurrentIndex = index;
    });
  }

  Categoria get _categoriaAtual {
    return categoriaMock[_whiskysCurrentIndex];
  }

  String get _categoriaAtualNome {
    return _categoriaAtual.nome;
  }

  List<Bebida> get _categoriaAtualBebidas {
    return bebidaMock.where((element) => element.categoria == _categoriaAtual.id).toList();
  }

  (Categoria, List<Bebida>) get extra {
    late Categoria categoria;
    late List<Bebida> bebidas;
    for (final cat in categoriaMock) {
      bebidas = bebidaMock.where((element) => element.categoria == cat.id).toList();
      if (cat.id == _categoriaAtual.id || bebidas.isEmpty) {
        continue;
      }
      categoria = cat;
      break;
    }
    return (categoria, bebidas);
  }

  void _irParaDetalhes(Bebida bebida) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(bebida: bebida)));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Material(
      child: Stack(
        children: [
          Container(
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
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _categoriaAtualNome,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Carrossel(
                          key: _carroseelKey,
                          currentIndex: _whiskysCurrentIndex,
                          onChanged: _changeWhiskysCurrentIndex,
                          childrens: categoriaMock.map((e) => CarrosselItem(e.nome)).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: _BEBIDA_CONTAINER_SIZE + _BEBIDA_DESCRICAO_HEIGHT + _BEBIDA_DESCRICAO_MARGIN_BOTTOM,
                        child: _categoriaAtualBebidas.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'A categoria ${_categoriaAtual.nome} não possui nenhuma bebida disponível no momento.',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _categoriaAtualBebidas.length,
                                itemBuilder: (context, index) {
                                  final bebida = _categoriaAtualBebidas[index];
                                  return InkWell(
                                    onTap: () => _irParaDetalhes(bebida),
                                    child: Container(
                                      width: _fractionSize,
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: _BEBIDA_CONTAINER_SIZE,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    height: _fractionSize,
                                                    width: _fractionSize,
                                                    decoration: BoxDecoration(
                                                      color: bebida.cor.withOpacity(0.4),
                                                      borderRadius: const BorderRadius.only(
                                                        topLeft: Radius.circular(15),
                                                        topRight: Radius.circular(15),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: _fractionSize,
                                                  height: _fractionSize,
                                                  margin: const EdgeInsets.only(bottom: 20),
                                                  child: Hero(tag: BebidaUtils.createBebidaTag(bebida), child: Image.network(bebida.imagem)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: _BEBIDA_DESCRICAO_HEIGHT,
                                            margin: const EdgeInsets.only(bottom: _BEBIDA_DESCRICAO_MARGIN_BOTTOM),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: kElevationToShadow[4],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(15),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10, top: 5),
                                                    child: Row(
                                                      children: List.generate(
                                                        QUANTIDADE_ESTRELAS_NOTA,
                                                        (index) => Icon(
                                                          Icons.star,
                                                          color: bebida.nota > (VALOR_MAXIMO_PARA_NOTA / QUANTIDADE_ESTRELAS_NOTA) * index + 1
                                                              ? Colors.yellow
                                                              : Colors.grey.withOpacity(0.5),
                                                        ),
                                                      ).toList(),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                                                  child: Text(
                                                    bebida.nome,
                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 20),
                                                  child: Text(
                                                    "R\$ ${bebida.valor}",
                                                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          extra.$1.nome,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: extra.$2
                            .map(
                              (e) => InkWell(
                                onTap: () => _irParaDetalhes(e),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Hero(
                                          tag: BebidaUtils.createBebidaTag(e),
                                          child: Image.network(e.imagem),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.star, color: Colors.yellow),
                                              const SizedBox(width: 10),
                                              Text(
                                                '${e.nota}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            e.nome,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'R\$ ${e.valor}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 17,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: const SafeArea(
                top: false,
                child: Row(
                  children: [
                    _BottomBarItem(Icons.home),
                    _BottomBarItem(Icons.wallet, notificationsCount: 2),
                    _BottomBarItem(Icons.receipt),
                    _BottomBarItem(Icons.person),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem(this.icon, {this.notificationsCount});

  final IconData icon;
  final int? notificationsCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        child: SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            children: [
              Align(
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              if (notificationsCount != null)
                Positioned(
                  right: 1,
                  top: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        notificationsCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
