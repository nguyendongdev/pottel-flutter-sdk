class AddressSuggestionModel {
  AddressSuggestionModel({
    required this.id,
    required this.name,
    required this.address,
    this.provinceAreaPostCode,
    this.wardAreaPostCode,
  });

  final String id;
  final String name;
  final String address;
  final int? provinceAreaPostCode;
  final int? wardAreaPostCode;

  factory AddressSuggestionModel.fromJson(Map<String, dynamic> json) {
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      return int.tryParse(value.toString());
    }

    return AddressSuggestionModel(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      address: (json['address'] ?? '').toString(),
      provinceAreaPostCode: parseInt(json['provinceAreaPostCode']),
      wardAreaPostCode: parseInt(json['wardAreaPostCode']),
    );
  }
}
