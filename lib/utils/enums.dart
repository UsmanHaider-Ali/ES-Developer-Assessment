enum ApiStatus { loading, success, error, noInternet }

enum Genre {
  unknow(0, "Unknown"),
  action(28, "Action"),
  adventure(12, "Adventure"),
  animation(16, "Animation"),
  comedy(35, "Comedy"),
  crime(80, "Crime"),
  documentary(99, "Documentary"),
  drama(18, "Drama"),
  family(10751, "Family"),
  fantasy(14, "Fantasy"),
  history(36, "History"),
  horror(27, "Horror"),
  music(10402, "Music"),
  mystery(9648, "Mystery"),
  romance(10749, "Romance"),
  scienceFiction(878, "Science Fiction"),
  tvMovie(10770, "TV Movie"),
  thriller(53, "Thriller"),
  war(10752, "War"),
  western(37, "Western");

  final int id;
  final String name;

  const Genre(this.id, this.name);

  static Genre? getById(int id) => Genre.values.firstWhere((genre) => genre.id == id, orElse: () => unknow);
}
