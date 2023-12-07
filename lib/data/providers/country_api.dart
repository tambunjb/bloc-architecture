import 'package:http/http.dart' as http;

class CountryApi {
  Future<http.Response> getCountries(String name) async {
    final http.Response response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/name/$name'));
    return response;
  }
}
