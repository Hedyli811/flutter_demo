class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  Address? address;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  String? street;
  String? suite;

  Address({this.street, this.suite});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
    );
  }
}
