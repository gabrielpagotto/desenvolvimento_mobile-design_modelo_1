// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Bebida {
  final String nome;
  final double valor;
  final double nota;
  final int quantidade;
  final String medidaVolume;
  final double teorAlcolico;
  final String descricao;
  final int categoria;
  final String imagem;
  final Color cor;

  const Bebida({
    required this.nome,
    required this.valor,
    required this.nota,
    required this.quantidade,
    required this.medidaVolume,
    required this.teorAlcolico,
    required this.descricao,
    required this.categoria,
    required this.imagem,
    required this.cor,
  });

  Bebida copyWith({
    String? nome,
    double? valor,
    double? nota,
    int? quantidade,
    String? medidaVolume,
    double? teorAlcolico,
    String? descricao,
    int? categoria,
    String? imagem,
    Color? cor,
  }) {
    return Bebida(
      nome: nome ?? this.nome,
      valor: valor ?? this.valor,
      nota: nota ?? this.nota,
      quantidade: quantidade ?? this.quantidade,
      medidaVolume: medidaVolume ?? this.medidaVolume,
      teorAlcolico: teorAlcolico ?? this.teorAlcolico,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      imagem: imagem ?? this.imagem,
      cor: cor ?? this.cor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'valor': valor,
      'nota': nota,
      'quantidade': quantidade,
      'medidaVolume': medidaVolume,
      'teorAlcolico': teorAlcolico,
      'descricao': descricao,
      'categoria': categoria,
      'imagem': imagem,
      'cor': cor.value,
    };
  }

  factory Bebida.fromMap(Map<String, dynamic> map) {
    return Bebida(
      nome: map['nome'] as String,
      valor: map['valor'] as double,
      nota: map['nota'] as double,
      quantidade: map['quantidade'] as int,
      medidaVolume: map['medidaVolume'] as String,
      teorAlcolico: map['teorAlcolico'] as double,
      descricao: map['descricao'] as String,
      categoria: map['categoria'] as int,
      imagem: map['imagem'] as String,
      cor: Color(map['cor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bebida.fromJson(String source) => Bebida.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bebida(nome: $nome, valor: $valor, nota: $nota, quantidade: $quantidade, medidaVolume: $medidaVolume, teorAlcolico: $teorAlcolico, descricao: $descricao, categoria: $categoria, imagem: $imagem, cor: $cor)';
  }

  @override
  bool operator ==(covariant Bebida other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.valor == valor &&
        other.nota == nota &&
        other.quantidade == quantidade &&
        other.medidaVolume == medidaVolume &&
        other.teorAlcolico == teorAlcolico &&
        other.descricao == descricao &&
        other.categoria == categoria &&
        other.imagem == imagem &&
        other.cor == cor;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        valor.hashCode ^
        nota.hashCode ^
        quantidade.hashCode ^
        medidaVolume.hashCode ^
        teorAlcolico.hashCode ^
        descricao.hashCode ^
        categoria.hashCode ^
        imagem.hashCode ^
        cor.hashCode;
  }
}
