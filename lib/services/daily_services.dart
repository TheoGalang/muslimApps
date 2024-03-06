import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/models/daily_model.dart';

class DailyServices {
  Future<DailyModel> getDailyPrayer() async {
    final String response = await rootBundle.loadString('assets/mock_data/today.json');
    final data = await json.decode(response);
    if(data == null){
      return DailyModel(code: data['code'], status: data['status'], data: data['data']);
    } else {
      return DailyModel.fromJson(data);
    }
  }
}