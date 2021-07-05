import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/boleto_model.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final boletosString = prefs.getStringList("boletos") ?? <String>[];
      boletos = boletosString.map((b) => BoletoModel.fromJson(b)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }
}
