import 'package:flutter/material.dart';
import 'package:mobile_modelo_1/src/data/bebida.dart';

List<Bebida> get bebidaMock => [
      const Bebida(
        nome: "Chivas Regal",
        valor: 560.00,
        nota: 8.84,
        quantidade: 1,
        medidaVolume: "L",
        teorAlcolico: 46.7,
        descricao: "Chivas Regal 12 Años Whisky 1 L. Uma mistura dos melhores whiskies de malta e grano, maduros durante pelo menos 12 anos.",
        categoria: 2,
        imagem: "https://fs-vendola-images.s3.amazonaws.com/9ff297985e120fa31937-WhiskyChivasRegal12anos1L1.png",
        cor: Colors.amber,
      ),
      const Bebida(
        nome: "Wild Turkey 81",
        valor: 654.00,
        nota: 4.9,
        quantidade: 1,
        medidaVolume: "L",
        teorAlcolico: 40.5,
        descricao: "Wild Turkey 81 é um whisky bourbon produzido nos Estados Unidos. Possui um sabor rico e notas de baunilha e caramelo.",
        categoria: 2,
        imagem: "https://www.pngkit.com/png/full/318-3188253_wild-turkey-81-proof-wild-turkey-bourbon.png",
        cor: Colors.orange,
      ),
      const Bebida(
        nome: "Heineken",
        valor: 7.00,
        nota: 9.9,
        quantidade: 330,
        medidaVolume: "ML",
        teorAlcolico: 5.00,
        descricao:
            "A Heineken é uma das cervejas mais icônicas e amplamente reconhecidas em todo o mundo, representando a qualidade cervejeira da Holanda. Esta cerveja premium é conhecida por seu sabor característico e refrescante, que combina perfeitamente a tradição cervejeira holandesa com a inovação contemporânea.",
        categoria: 6,
        imagem: "https://s3-sa-east-1.amazonaws.com/superimg/img.produtos/78905498/img_500_1.png",
        cor: Colors.green,
      ),
    ];
