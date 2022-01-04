class FlyModel {
  final String? cityImg;
  final String? cityName;
  final String? cityInfo;

  FlyModel({
    required this.cityImg,
    required this.cityName,
    required this.cityInfo,
  });
}

List<FlyModel> cityInfos = [
  FlyModel(
      cityName: 'Seoul',
      cityImg:
          'https://cdn.pixabay.com/photo/2020/11/24/02/13/gyeongbok-palace-5771324__340.jpg',
      cityInfo: 'Seoul, Korea'),
  FlyModel(
      cityName: 'Milan',
      cityImg:
          'https://cdn.pixabay.com/photo/2017/06/24/00/54/milan-cathedral-2436458__340.jpg',
      cityInfo: 'Milan, Rome'),
  FlyModel(
      cityName: 'NewYork',
      cityImg:
          'https://cdn.pixabay.com/photo/2015/05/01/15/13/new-york-748631__340.jpg',
      cityInfo: 'NewYork, America'),
  FlyModel(
      cityName: 'Beijing',
      cityImg:
          'https://cdn.pixabay.com/photo/2015/06/11/08/25/china-805587__340.jpg',
      cityInfo: 'Beijing, China'),
  FlyModel(
      cityName: 'ToKyo',
      cityImg:
          'https://cdn.pixabay.com/photo/2019/04/20/11/39/japan-4141578__340.jpg',
      cityInfo: 'ToKyo, Japan'),
];
