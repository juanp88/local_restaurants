import 'package:flutter/material.dart';
import 'package:local_restaurants/services/countries_api.dart';

import '../models/countriesResponse.dart';
import '../models/country.dart';

class SearchViewModel extends ChangeNotifier {
  List<Country> _countryList = [];
  bool _isLoading = false;
  String _filteredCountry = "";

  get countryList => _countryList;
  get isLoading => _isLoading;
  get filteredCountry => _filteredCountry;

  setCountryList(List<Country> list) {
    _countryList = list;
    notifyListeners();
  }

  setFilteredCountry(String country) {
    _filteredCountry = country;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  SearchViewModel() {
    getCountries();
  }

  getCountries() async {
    setIsLoading(true);
    var response = await CountriesAPi.getCountries() as countries;
    if (response.error == false) {
      setCountryList(response.data!);
    }
    setIsLoading(false);
  }
}
