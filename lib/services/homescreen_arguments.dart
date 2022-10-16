class HomeScreenArguments {
  String? time;
  String? flag;
  String? location;
  bool? isDaytime = true;
  bool isEmpty = true;

  HomeScreenArguments(this.time, this.flag, this.location, this.isDaytime) {
    isEmpty = false;
  }

  String toString() {
    return '$time $location';
  }
}