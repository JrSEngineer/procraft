

class NewAddress {
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  NewAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory NewAddress.fromMap(Map<String, dynamic> map) {
    return NewAddress(
      street: map['street'],
      city: map['city'],
      state: map['state'],
      zipCode: map['zipCode'],
      country: map['country'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
    };
  }
}
