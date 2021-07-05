import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/boleto_model.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({
    String? nome,
    String? vencimento,
    double? valor,
    String? codigo,
  }) {
    model = model.copyWith(
      name: nome,
      vencimento: vencimento,
      valor: valor,
      codigo: codigo,
    );
  }

  Future<void> saveBoleto() async {
    final prefs = await SharedPreferences.getInstance();
    final boletos = prefs.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await prefs.setStringList("boletos", boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
