class Usermodel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? imageName;
   String? sportsList;

  Usermodel({this.id, this.name, this.email, this.mobile, this.imageName,this.sportsList});

  Usermodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    imageName = json['image_name'];
      sportsList = json['sports_list'];
  }

}
