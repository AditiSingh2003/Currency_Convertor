import 'package:http/http.dart' as http;

import '../models/ratesmodel.dart';

Future<RatesModel> fetchrates() async{
  final response = await http.get(Uri.parse("https://openexchangerates.org/api/latest.json?app_id='fb60fc2553414d6ebd645b373d3472a6'"));
  print(response.body);
  final result = ratesModelFromJson(response.body);

  return result;
}