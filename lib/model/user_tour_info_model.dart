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
}

List<UserTourInfoModel> userTourInfos = [
  UserTourInfoModel(
    travelerInfo: '1 Adult, Economy',
    tourCityCountry: 'City, Country',
    chooseDestination: 'ChooseDestination',
    departureArrivalDate: 'DepartureDate, ArrivalDate',
  ),
];
