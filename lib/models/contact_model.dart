class ContactModel {
  final int id;
  final String firstname;
  final String lastname;
  final String address;
  final String email;
  final String gender;
  final String dob;

  ContactModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.address,
    required this.dob,
    required this.email,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        gender: json['gender'],
        address: json['address'],
        dob: json['dob'],
        email: json['email']);
  }
}
