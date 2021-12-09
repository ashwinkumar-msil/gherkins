import 'package:gherkins/model/contact_data_model.dart';
import 'package:gherkins/src/string.dart';

import 'network.dart';

class ContactService {
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    var contactdata = contactFromJson(response);
    return contactdata;
  }
}
