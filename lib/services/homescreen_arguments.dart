class HomeScreenArguments {
  String? time;
  String? flag;
  String? location;

  HomeScreenArguments(this.time, this.flag, this.location);

  String toString() {
    return '$time $location';
  }
}