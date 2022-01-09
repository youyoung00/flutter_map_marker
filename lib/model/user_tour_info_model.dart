class UserTourInfoModel {
  String? travelerInfo;
  String? tourCityCountry;
  String? chooseDestination;
  String? departureArrivalDate;

  UserTourInfoModel(
      {this.travelerInfo,
      this.tourCityCountry,
      this.chooseDestination,
      this.departureArrivalDate});

  static String tInfo = '1 Adult, Economy';
  static String tCityCountry = 'City, Country';
  static String destination = 'Choose Destination';
  static String depArrDate = 'DepartureDate, ArrivalDate';
}

List<UserTourInfoModel> userTourInfos = [
  UserTourInfoModel(
    travelerInfo: UserTourInfoModel.tInfo,
    tourCityCountry: UserTourInfoModel.tCityCountry,
    chooseDestination: UserTourInfoModel.destination,
    departureArrivalDate: UserTourInfoModel.depArrDate,
  ),
];
