import 'dart:convert';

import 'package:demo/models/contact_model.dart';
import 'package:http/http.dart';

class ApiServices {
  String contactEndpooint = 'https://nanashikenta.pythonanywhere.com/users/';

  Future<List<ContactModel>> getContacts() async {
    Response response = await get(Uri.parse(contactEndpooint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ContactModel.fromJson(e)).toList();
    } else {
      throw Exception((response.reasonPhrase));
    }
  }
}
