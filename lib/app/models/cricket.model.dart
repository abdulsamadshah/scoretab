// class CricketModel {

//   List<SportEvents>? sportEvents;

//   CricketModel({this.sportEvents});

//   CricketModel.fromJson(Map<String, dynamic> json) {

//     if (json['sport_events'] != null) {
//       sportEvents = <SportEvents>[];
//       json['sport_events'].forEach((v) {
//         sportEvents!.add( SportEvents.fromJson(v));
//       });
//     }
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['generated_at'] = this.generatedAt;
//   //   data['schema'] = this.schema;
//   //   if (this.sportEvents != null) {
//   //     data['sport_events'] = this.sportEvents!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }

// class SportEvents {
//   String? id;
//   String? scheduled;
//   bool? startTimeTbd;
//   String? status;
//   TournamentRound? tournamentRound;
//   Season? season;
//   Tournament? tournament;
//   List<Competitors>? competitors;
//   Venue? venue;

//   SportEvents(
//       {this.id,
//       this.scheduled,
//       this.startTimeTbd,
//       this.status,
//       this.tournamentRound,
//       this.season,
//       this.tournament,
//       this.competitors,
//       this.venue});

//   SportEvents.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     scheduled = json['scheduled'];
//     startTimeTbd = json['start_time_tbd'];
//     status = json['status'];
//     tournamentRound = json['tournament_round'] != null
//         ?  TournamentRound.fromJson(json['tournament_round'])
//         : null;
//     season =
//         json['season'] != null ?  Season.fromJson(json['season']) : null;
//     tournament = json['tournament'] != null
//         ?  Tournament.fromJson(json['tournament'])
//         : null;
//     if (json['competitors'] != null) {
//       competitors = <Competitors>[];
//       json['competitors'].forEach((v) {
//         competitors!.add( Competitors.fromJson(v));
//       });
//     }
//     venue = json['venue'] != null ?  Venue.fromJson(json['venue']) : null;
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['scheduled'] = this.scheduled;
//   //   data['start_time_tbd'] = this.startTimeTbd;
//   //   data['status'] = this.status;
//   //   if (this.tournamentRound != null) {
//   //     data['tournament_round'] = this.tournamentRound!.toJson();
//   //   }
//   //   if (this.season != null) {
//   //     data['season'] = this.season!.toJson();
//   //   }
//   //   if (this.tournament != null) {
//   //     data['tournament'] = this.tournament!.toJson();
//   //   }
//   //   if (this.competitors != null) {
//   //     data['competitors'] = this.competitors!.map((v) => v.toJson()).toList();
//   //   }
//   //   if (this.venue != null) {
//   //     data['venue'] = this.venue!.toJson();
//   //   }
//   //   return data;
//   // }
// }

// class TournamentRound {
//   String? type;
//   int? number;

//   TournamentRound({this.type, this.number});

//   TournamentRound.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     number = json['number'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['type'] = this.type;
//   //   data['number'] = this.number;
//   //   return data;
//   // }
// }

// class Season {
//   String? id;
//   String? name;
//   String? startDate;
//   String? endDate;
//   String? year;
//   String? tournamentId;

//   Season(
//       {this.id,
//       this.name,
//       this.startDate,
//       this.endDate,
//       this.year,
//       this.tournamentId});

//   Season.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     year = json['year'];
//     tournamentId = json['tournament_id'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['start_date'] = this.startDate;
//   //   data['end_date'] = this.endDate;
//   //   data['year'] = this.year;
//   //   data['tournament_id'] = this.tournamentId;
//   //   return data;
//   // }
// }

// class Tournament {
//   String? id;
//   String? name;
//   Sport? sport;
//   Category? category;
//   String? type;
//   String? gender;

//   Tournament(
//       {this.id, this.name, this.sport, this.category, this.type, this.gender});

//   Tournament.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     type = json['type'];
//     gender = json['gender'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   if (this.sport != null) {
//   //     data['sport'] = this.sport!.toJson();
//   //   }
//   //   if (this.category != null) {
//   //     data['category'] = this.category!.toJson();
//   //   }
//   //   data['type'] = this.type;
//   //   data['gender'] = this.gender;
//   //   return data;
//   // }
// }

// class Sport {
//   String? id;
//   String? name;

//   Sport({this.id, this.name});

//   Sport.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   return data;
//   // }
// }

// class Category {
//   String? id;
//   String? name;
//   String? countryCode;

//   Category({this.id, this.name, this.countryCode});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     countryCode = json['country_code'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['country_code'] = this.countryCode;
//   //   return data;
//   // }
// }

// class Competitors {
//   String? id;
//   String? name;
//   String? country;
//   String? countryCode;
//   String? abbreviation;
//   String? qualifier;

//   Competitors(
//       {this.id,
//       this.name,
//       this.country,
//       this.countryCode,
//       this.abbreviation,
//       this.qualifier});

//   Competitors.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     country = json['country'];
//     countryCode = json['country_code'];
//     abbreviation = json['abbreviation'];
//     qualifier = json['qualifier'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['country'] = this.country;
//   //   data['country_code'] = this.countryCode;
//   //   data['abbreviation'] = this.abbreviation;
//   //   data['qualifier'] = this.qualifier;
//   //   return data;
//   // }
// }

// class Venue {
//   String? id;
//   String? name;
//   int? capacity;
//   String? cityName;
//   String? countryName;
//   String? countryCode;

//   Venue(
//       {this.id,
//       this.name,
//       this.capacity,
//       this.cityName,
//       this.countryName,
//       this.countryCode});

//   Venue.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     capacity = json['capacity'];
//     cityName = json['city_name'];
//     countryName = json['country_name'];
//     countryCode = json['country_code'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['capacity'] = this.capacity;
//   //   data['city_name'] = this.cityName;
//   //   data['country_name'] = this.countryName;
//   //   data['country_code'] = this.countryCode;
//   //   return data;
//   // }
// }

class CricketModel {
  String? id;
  String? scheduled;
  bool? startTimeTbd;
  String? status;
  TournamentRound? tournamentRound;
  Season? season;
  Tournament? tournament;
  List<Competitors>? competitors;
  Venue? venue;

  CricketModel(
      {this.id,
      this.scheduled,
      this.startTimeTbd,
      this.status,
      this.tournamentRound,
      this.season,
      this.tournament,
      this.competitors,
      this.venue});

  CricketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduled = json['scheduled'];
    startTimeTbd = json['start_time_tbd'];
    status = json['status'];
    tournamentRound = json['tournament_round'] != null
        ? TournamentRound.fromJson(json['tournament_round'])
        : null;
    season =
        json['season'] != null ? Season.fromJson(json['season']) : null;
    tournament = json['tournament'] != null
        ? Tournament.fromJson(json['tournament'])
        : null;
    if (json['competitors'] != null) {
      competitors = <Competitors>[];
      json['competitors'].forEach((v) {
        competitors!.add(Competitors.fromJson(v));
      });
    }
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['scheduled'] = this.scheduled;
//     data['start_time_tbd'] = this.startTimeTbd;
//     data['status'] = this.status;
//     if (this.tournamentRound != null) {
//       data['tournament_round'] = this.tournamentRound!.toJson();
//     }
//     if (this.season != null) {
//       data['season'] = this.season!.toJson();
//     }
//     if (this.tournament != null) {
//       data['tournament'] = this.tournament!.toJson();
//     }
//     if (this.competitors != null) {
//       data['competitors'] = this.competitors!.map((v) => v.toJson()).toList();
//     }
//     if (this.venue != null) {
//       data['venue'] = this.venue!.toJson();
//     }
//     return data;
//   }
}

class TournamentRound {
  String? type;
  int? number;

  TournamentRound({this.type, this.number});

  TournamentRound.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    number = json['number'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['type'] = this.type;
  //   data['number'] = this.number;
  //   return data;
  // }
}

class Season {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  String? year;
  String? tournamentId;

  Season(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.year,
      this.tournamentId});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    year = json['year'];
    tournamentId = json['tournament_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['start_date'] = this.startDate;
  //   data['end_date'] = this.endDate;
  //   data['year'] = this.year;
  //   data['tournament_id'] = this.tournamentId;
  //   return data;
  // }
}

class Tournament {
  String? id;
  String? name;
  Sport? sport;
  Category? category;
  String? type;
  String? gender;

  Tournament(
      {this.id, this.name, this.sport, this.category, this.type, this.gender});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sport = json['sport'] != null ? Sport.fromJson(json['sport']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    type = json['type'];
    gender = json['gender'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   if (this.sport != null) {
  //     data['sport'] = this.sport!.toJson();
  //   }
  //   if (this.category != null) {
  //     data['category'] = this.category!.toJson();
  //   }
  //   data['type'] = this.type;
  //   data['gender'] = this.gender;
  //   return data;
  // }
}

class Sport {
  String? id;
  String? name;

  Sport({this.id, this.name});

  Sport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   return data;
  // }
}

class Category {
  String? id;
  String? name;
  String? countryCode;

  Category({this.id, this.name, this.countryCode});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['country_code'] = this.countryCode;
  //   return data;
  // }
}

class Competitors {
  String? id;
  String? name;
  String? country;
  String? countryCode;
  String? abbreviation;
  String? qualifier;

  Competitors(
      {this.id,
      this.name,
      this.country,
      this.countryCode,
      this.abbreviation,
      this.qualifier});

  Competitors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    countryCode = json['country_code'];
    abbreviation = json['abbreviation'];
    qualifier = json['qualifier'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['country'] = this.country;
  //   data['country_code'] = this.countryCode;
  //   data['abbreviation'] = this.abbreviation;
  //   data['qualifier'] = this.qualifier;
  //   return data;
  // }
}

class Venue {
  String? id;
  String? name;
  int? capacity;
  String? cityName;
  String? countryName;
  String? countryCode;

  Venue(
      {this.id,
      this.name,
      this.capacity,
      this.cityName,
      this.countryName,
      this.countryCode});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    capacity = json['capacity'];
    cityName = json['city_name'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['capacity'] = this.capacity;
  //   data['city_name'] = this.cityName;
  //   data['country_name'] = this.countryName;
  //   data['country_code'] = this.countryCode;
  //   return data;
  // }
}
