import 'country.dart';

class countries {
  bool? error;
  String? msg;
  List<Country>? data;

  countries({this.error, this.msg, this.data});

  countries.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Country>[];
      json['data'].forEach((v) {
        data!.add(new Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
