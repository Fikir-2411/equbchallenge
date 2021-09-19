import 'dart:convert';
import 'package:equbchallenge/challenge/models/collected_money_model.dart';
import 'package:equbchallenge/challenge/models/due_payments_model.dart';
import 'package:http/http.dart' as http;

class DataApi {
  String endPoint = 'https://610e396448beae001747ba80.mockapi.io';

  Future<List<DuePaymentModel>> getDuePayments() async {
    try {
      final http.Response response =
          await http.get(Uri.parse('$endPoint/duePayments'));
      if (response.statusCode == 200) {
        final duePayments = jsonDecode(response.body) as List;
        return (duePayments
            .map((duePayment) => DuePaymentModel.fromJson(duePayment))
            .toList());
      } else {
        throw Exception('Failed to load duePayments');
      }
    } catch (e) {
      throw Exception((e));
    }
  }

  Future<List<CollectedMoneyModel>> getCollectedMoney() async {
    try {
      final http.Response response =
          await http.get(Uri.parse('$endPoint/collectedPayments'));
      if (response.statusCode == 200) {
        final collectedMoneys = jsonDecode(response.body) as List;
        return (collectedMoneys
            .map((collectedMoney) =>
                CollectedMoneyModel.fromJson(collectedMoney))
            .toList());
      } else {
        throw Exception('Failed to load CollectedMoney');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
