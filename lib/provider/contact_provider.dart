import 'package:demo/models/contact_model.dart';
import 'package:demo/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conatctProvider = Provider<ApiServices>((ref) => ApiServices());

final dataProvider = FutureProvider<List<ContactModel>>((ref) async {
  return ref.watch(conatctProvider).getContacts();
});
