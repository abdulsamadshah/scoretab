
class GamesOnDateModel {
  // List<MatchData>? matchData;
 String? date;
String? game;
  
  int? diff;
  GamesOnDateModel({this.date, this.game,  this.diff});

  GamesOnDateModel.fromJson(Map<String, dynamic> json) {
     date = json['date'];
    game = json['game'];
    diff = json['diff'];
  }

 
}

