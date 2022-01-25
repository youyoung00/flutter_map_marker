import 'package:flutter/material.dart';
import 'package:flutter_map_marker/model/fly_city_Info_model.dart';
import 'package:flutter_map_marker/ui/fly/fly_city_google_map.dart';

class SlidingPanelItem extends StatefulWidget {
  final List<FlyCityInfoModel> cityInfoList;
  final String selectedCityCountry;

  const SlidingPanelItem({
    Key? key,
    required this.cityInfoList,
    required this.selectedCityCountry,
  }) : super(key: key);

  @override
  State<SlidingPanelItem> createState() => _SlidingPanelItemState();
}

class _SlidingPanelItemState extends State<SlidingPanelItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Travel Destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cityInfoList.length,
              itemBuilder: (BuildContext context, int i) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          var selectedCityCountry = cityInfoList[i].cityInfo;
                        });
                        Navigator.pushNamed(
                          context,
                          CityMap.routeName,
                          arguments: FlyCityInfoModel(
                            cityInfo: cityInfoList[i].cityInfo,
                            cityName: cityInfoList[i].cityName,
                            cityImg: cityInfoList[i].cityImg,
                          ),
                        );
                      },
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            cityInfoList[i].cityImg.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(cityInfoList[i].cityName.toString()),
                        subtitle: Text(cityInfoList[i].cityInfo.toString()),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
