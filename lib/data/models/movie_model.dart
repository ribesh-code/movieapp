class MovieModel {
  bool? video;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  int? voteCount;
  bool? adult;
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  double? popularity;
  String? mediaType;

  MovieModel(
      {this.video,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.adult,
      this.backdropPath,
      this.title,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.popularity,
      this.mediaType});

  MovieModel.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    title = json['title'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['vote_count'] = voteCount;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['title'] = title;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}
