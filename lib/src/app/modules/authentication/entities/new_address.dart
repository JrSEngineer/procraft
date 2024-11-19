class NewAddress {
  String addressNumber;
  String street;
  String city;
  String state;
  String zipCode;
  String country;

  NewAddress({
    required this.addressNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory NewAddress.fromMap(Map<String, dynamic> map) {
    return NewAddress(
      addressNumber: map['addressNumber'],
      street: map['street'],
      city: map['city'],
      state: map['state'],
      zipCode: map['zipCode'],
      country: map['country'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addressNumber': addressNumber,
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
    };
  }
}
