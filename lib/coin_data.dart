import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = "<YOUR_API_KEY_HERE>";
  String url = "https://rest.coinapi.io";
  String uri = "v1/exchangerate";
  Future<dynamic> getCoinData(String currency) async {

    http.Response btcResponse = await http.get(
      Uri.parse("$url/$uri/BTC/${currency.toString()}/?apiKey=$apiKey"),
    );

    http.Response ethResponse = await http.get(
      Uri.parse("$url/$uri/ETH/${currency.toString()}/?apiKey=$apiKey"),
    );

    http.Response ltcResponse = await http.get(
      Uri.parse("$url/$uri/LTC/${currency.toString()}/?apiKey=$apiKey"),
    );

    if (btcResponse.statusCode == 200 && ethResponse.statusCode == 200 && ltcResponse.statusCode == 200) {
      return {
        "btc": jsonDecode(btcResponse.body)["rate"],
        "eth": jsonDecode(ethResponse.body)["rate"],
        "ltc": jsonDecode(ltcResponse.body)["rate"]
      };
    }
    return;
  }
}
