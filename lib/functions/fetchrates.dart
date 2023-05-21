import 'package:currency_convertor/models/allCurrencies.dart';
import 'package:http/http.dart' as http;
import '../models/ratesmodel.dart';

Future<RatesModel> fetchrates() async{
  final response = await http.get(Uri.parse("https://openexchangerates.org/api/latest.json?app_id='fb60fc2553414d6ebd645b373d3472a6'"));
  print(response.body);
  final result = ratesModelFromJson(response.body);

  return result;
}

Future<Map> fetchcurrencies() async{
  final response = await http.get(Uri.parse("https://openexchangerates.org/api/currencies.json?app_id='fb60fc2553414d6ebd645b373d3472a6'"));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertusd(Map exchangeRates, String usd, String currency)
{
  String output = ((exchangeRates[currency]* double.parse(usd)).toStringAsFixed(2)).toString();
  return output;
}

String convertany(Map exchangeRates, String amount, String currencyBase, String currencyFinal)
{
  String output = ((double.parse(amount) / exchangeRates[currencyBase]) * exchangeRates[currencyFinal]).toStringAsFixed(2).toString();
  return output;
}