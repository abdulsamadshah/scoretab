class AllGamesModel {
  String? game;
  List<ListGame>? listGame;
  String? date;

  AllGamesModel({this.game, this.listGame});

  AllGamesModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    game = json['game'];
    if (json['list_game'] != null) {
      listGame = <ListGame>[];
      json['list_game'].forEach((v) {
        listGame!.add(ListGame.fromJson(v));
      });
    }
  }
}

class ListGame {
  int? id;
  String? matchDate;
  String? time;
  String? race;
  String? opponent1;
  String? opponent2;
  String? details;
  String? tournament;
  String? venue;
  String? city;
  String? country;
  String? channel1;
  String? ott1;
  num? isActive;
  num? isDelete;
  String? createdAt;
  String? updatedAt;
  GetOpp1? getOpp1;
  GetOpp1? getOpp2;

  ListGame({
    this.id,
    this.matchDate,
    this.time,
    this.race,
    this.opponent1,
    this.opponent2,
    this.details,
    this.tournament,
    this.venue,
    this.city,
    this.country,
    this.channel1,
    this.ott1,
    this.isActive,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.getOpp1,
    this.getOpp2,
  });

  ListGame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchDate = json['match_date'];
    time = json['time'];
    race = json['race'];
    opponent1 = json['opponent_1'];
    opponent2 = json['opponent_2'];
    details = json['details'];
    tournament = json['tournament'];
    venue = json['venue'];
    city = json['city'];
    country = json['country'];
    channel1 = json['channel1'];
    ott1 = json['ott1'];
    isActive = json['is_active'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getOpp1 =
        json['get_opp_1'] != null ? GetOpp1.fromJson(json['get_opp_1']) : null;
    getOpp2 =
        json['get_opp_2'] != null ? GetOpp1.fromJson(json['get_opp_2']) : null;
  }
}

class GetOpp1 {
  int? id;
  String? category;
  String? teamName;
  String? imageName;
  String? imagePath;

  GetOpp1({
    this.id,
    this.category,
    this.teamName,
    this.imageName,
    this.imagePath,
  });

  GetOpp1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    teamName = json['team_name'];
    imageName = json['image_name'];
    imagePath = json['image_path'];
  }
}

class GetOpp2 {
  int? id;
  String? category;
  String? teamName;
  String? imageName;
  String? imagePath;

  GetOpp2({
    this.id,
    this.category,
    this.teamName,
    this.imageName,
    this.imagePath,
  });

  GetOpp2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    teamName = json['team_name'];
    imageName = json['image_name'];
    imagePath = json['image_path'];
  }
}

// class FormulaGame {
//   int? id;
//   String? matchDate;
//   String? time;
//   String? race;
//   String? venue;
//   String? city;
//   String? country;
//   String? details;
//   String? channel1;
//   String? ott1;
//   num? isActive;
//   num? isDelete;
//   GetOpp? getOpp;

//   FormulaGame({
//     this.id,
//     this.matchDate,
//     this.time,
//     this.race,
//     this.venue,
//     this.city,
//     this.country,
//     this.details,
//     this.channel1,
//     this.ott1,
//     this.isActive,
//     this.isDelete,
//     this.getOpp,
//   });

//   FormulaGame.fromJSON(Map<String, dynamic> json) {
//     id = json['id'];
//     matchDate = json['match_date'];
//     time = json['time'];
//     race = json['race'];
//     venue = json['venue'];
//     city = json['city'];
//     country = json['country'];
//     details = json['details'];
//     channel1 = json['channel1'];
//     ott1 = json['ott1'];
//     isActive = json['is_active'];
//     isDelete = json['is_delete'];
//     getOpp =
//         json['get_opp_1'] != null ? GetOpp.fromJson(json['get_opp_1']) : null;
//   }

//   FormulaGame.fromJson(v);
// }

// class GetOpp {
//   int? id;
//   String? category;
//   String? teamName;
//   String? imageName;
//   String? imagePath;

//   GetOpp({
//     this.id,
//     this.category,
//     this.teamName,
//     this.imageName,
//     this.imagePath,
//   });

//   GetOpp.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     category = json['category'];
//     teamName = json['team_name'];
//     imageName = json['image_name'];
//     imagePath = json['image_path'];
//   }
// }
