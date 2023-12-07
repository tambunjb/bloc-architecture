import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:bloc_architecture/data/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_architecture/data/providers/country_api.dart';

class CountryRepository {
  final CountryApi api = CountryApi();

  Future<List<Country>> getCountries(String name) async {
    http.Response result = await api.getCountries(name);

    if (result.statusCode == 200) {
      try {
        return jsonDecode(result.body)
            .map<Country>((c) => Country.fromJson(c))
            .toList();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return [];
  }
}
