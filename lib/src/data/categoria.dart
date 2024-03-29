// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Categoria {
  final int id;
  final String nome;
  const Categoria({
    required this.id,
    required this.nome,
  });

  Categoria copyWith({
    int? id,
    String? nome,
  }) {
    return Categoria(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) => Categoria.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categoria(id: $id, nome: $nome)';

  @override
  bool operator ==(covariant Categoria other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;
}
