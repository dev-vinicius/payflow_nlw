import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? vencimento;
  final double? valor;
  final String? codigo;
  BoletoModel({
    this.name,
    this.vencimento,
    this.valor,
    this.codigo,
  });

  BoletoModel copyWith({
    String? name,
    String? vencimento,
    double? valor,
    String? codigo,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      vencimento: vencimento ?? this.vencimento,
      valor: valor ?? this.valor,
      codigo: codigo ?? this.codigo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vencimento': vencimento,
      'valor': valor,
      'codigo': codigo,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      vencimento: map['vencimento'],
      valor: map['valor'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, vencimento: $vencimento, valor: $valor, codigo: $codigo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.vencimento == vencimento &&
        other.valor == valor &&
        other.codigo == codigo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        vencimento.hashCode ^
        valor.hashCode ^
        codigo.hashCode;
  }
}
