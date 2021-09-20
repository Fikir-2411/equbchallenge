import 'package:equbchallenge/challenge/datasprovider/fetch_api_data.dart';
import 'package:equbchallenge/challenge/models/collected_money_model.dart';
import 'package:flutter/cupertino.dart';

class CollectedMoneysProvider extends ChangeNotifier {
  List<CollectedMoneyModel> _collectedPaymentList = [];

  List<CollectedMoneyModel> get collectedPayment => _collectedPaymentList;

  setCollectedMoneys() async {
    DataApi dataApi = DataApi();
    _collectedPaymentList = await dataApi.getCollectedMoney();
    notifyListeners();
  }
}
