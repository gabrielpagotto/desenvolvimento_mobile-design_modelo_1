import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_modelo_1/src/data/bebida.dart';
import 'package:mobile_modelo_1/src/data/categoria.dart';
import 'package:mobile_modelo_1/src/mock/categoria_mock.dart';
import 'package:mobile_modelo_1/src/utils/bebida_utils.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.bebida});

  final Bebida bebida;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var quantidade = 1;

  void _back() {
    Navigator.of(context).pop();
  }

  Categoria get _categoria => categoriaMock.firstWhere((element) => element.id == widget.bebida.categoria);

  void addQuantidade() {
    setState(() {
      quantidade++;
    });
  }

  void removeQuantidade() {
    if (quantidade == 1) {
      return;
    }
    setState(() {
      quantidade--;
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.height * .5,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.height * .5,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.width,
                      child: Stack(
                        children: [
                          LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              height: constraints.maxHeight * .7,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                            );
                          }),
                          SafeArea(
                            child: Container(
                              alignment: Alignment.center,
                              child: Hero(tag: BebidaUtils.createBebidaTag(widget.bebida), child: Image.network(widget.bebida.imagem)),
                            ),
                          ),
                          SafeArea(
                            child: IconButton(
                              onPressed: _back,
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.bebida.nome,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 38,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.yellow),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${widget.bebida.nota}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'R\$ ${widget.bebida.valor}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Características',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              _CaracteriscaCard('Tipo', _categoria.nome),
                              const SizedBox(width: 10),
                              _CaracteriscaCard(
                                'Quantidade',
                                '${widget.bebida.quantidade}${widget.bebida.medidaVolume}',
                              ),
                              const SizedBox(width: 10),
                              _CaracteriscaCard(
                                'Teor Alc.',
                                '${widget.bebida.teorAlcolico}%',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Descrição',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.bebida.descricao,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 95,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: removeQuantidade,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          quantidade.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: addQuantidade,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Comprar',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQuery.padding.bottom),
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

class _CaracteriscaCard extends StatelessWidget {
  const _CaracteriscaCard(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxHeight * 1.5,
        height: constraints.maxHeight,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    });
  }
}
