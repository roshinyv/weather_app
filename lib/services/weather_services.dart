import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherRepo {
  WeatherRepo(this.url);
  final String url;
  Future getWeatherData() async {
    var serverurl = Uri.parse(url);

    http.Response response = await http.get(serverurl);
    if (response.statusCode == 200) {
      String data = response.body;
      var datas = jsonDecode(data);
      return datas;
    } else {
      print(response.statusCode);
    }
  }
}
