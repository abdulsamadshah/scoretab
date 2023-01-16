class ChoiceModel {
  int id;
  String? type;
  String? image_name;
  String? image_path;

  ChoiceModel({
    required this.id,
    this.type,
    this.image_name = 'http://52.195.12.43/public/no-image.png',
    this.image_path,
  });

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
        id: json['id'] ?? 0,
        type: json['type'],
        image_name: json['image_name'],
        image_path: json['image_path']);
  }
}
