class User {
  String token;
  List<String> favouriteStocks;
  bool isAdvanced;

  static final User _user = new User._internal();

  factory User(token, favouriteStocks, isAdvanced) {
    return _user;
  }

  User._internal(String token, List<String> favouriteStocks, bool isAdvanced) {
    this.token = token;
    this.favouriteStocks = favouriteStocks;
    this.isAdvanced = isAdvanced;
  }
}