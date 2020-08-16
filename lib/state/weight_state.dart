import 'package:flutter/material.dart';
import 'package:provider_sample/models/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(
      value: 54,
      time: DateTime.utc(2019, 10, 4),
    ),
    Weight(
      value: 57,
      time: DateTime.utc(2019, 11, 4),
    ),
    Weight(
      value: 58,
      time: DateTime.utc(2019, 12, 4),
    ),
  ];

  List<Weight> get weights => _weights;

  add(Weight weight){
    _weights.add(weight);
    notifyListeners();
  }
}
