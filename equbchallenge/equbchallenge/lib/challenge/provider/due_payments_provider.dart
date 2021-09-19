import 'package:equbchallenge/challenge/datasprovider/fetch_api_data.dart';
import 'package:equbchallenge/challenge/models/due_payments_model.dart';
import 'package:flutter/cupertino.dart';

class DuePaymentsPageProvider extends ChangeNotifier {
  List<DuePaymentModel> _duePaymentNames = [];

  List<DuePaymentModel> get duePayments => _duePaymentNames;

  setDuePayments() async {
    DataApi dataApi = DataApi();
    _duePaymentNames = await dataApi.getDuePayments();
    notifyListeners();
  }
}
