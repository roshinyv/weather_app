import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({this.weatherDecode, this.forecastDecode});
  final weatherDecode;
  final forecastDecode;
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var mainweather;
  var weather;
  var wind;
  var clouds;
  var locatiion;
  var forecast;
  // var forecastmain;
  // var forecastweather;
  var icon;

  int currentPos = 0;
  @override
  void initState() {
    super.initState();
    updateData(widget.weatherDecode, widget.forecastDecode);
  }

  void updateData(dynamic alldatas, forecastDecode) {
    mainweather = alldatas["main"];
    weather = alldatas["weather"];
    wind = alldatas["wind"];
    clouds = alldatas["clouds"];
    locatiion = alldatas;
    forecast = forecastDecode["list"];
    icon = weather["icon"].toString();
  
    print(icon+"===========================");
    // forecastmain = forecastDecode["list"]["main"];
    // forecastweather = forecastDecode["list"]["weather"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101039),
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          currentweather(),
          // forecastwidget(),
          hourlyBoxes(),
          dailyBoxes()
        ],
      ),
    );
  }

  Container currentweather() {
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mainweather["temp"].toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: '',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Today",
                    style: TextStyle(fontSize: 15, fontFamily: ''),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mainweather["temp"].toString(),
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: '',
                        fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //     height: 100,
                  //     child:
                  //     getWeatherIcon(weather["icon"].toString())),

                  Container(
                      height: 100, child: Image.asset('assets/icons/03d.png')),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.location_searching),
                  ),
                  Text(locatiion["name"]),
                ],
              )
            ],
          ),
        ));
  }

//   Container forecastwidget() {
//     return Container(
//       padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
//       margin: const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3),
//             )
//           ]),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             children: [
//               Container(
//                   child: Text(
//                 "Wind",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Colors.grey),
//               )),
//               Container(
//                   child: Text(
//                 "km/h",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                     color: Colors.black),
//               ))
//             ],
//           )),
//           Expanded(
//               child: Column(
//             children: [
//               Container(
//                   child: Text(
//                 "Humidity",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Colors.grey),
//               )),
//               Container(
//                   child: Text(
//                 "%",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                     color: Colors.black),
//               ))
//             ],
//           )),
//           Expanded(
//               child: Column(
//             children: [
//               Container(
//                   child: Text(
//                 "Pressure",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Colors.grey),
//               )),
//               Container(
//                   child: Text(
//                 "hPa",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                     color: Colors.black),
//               ))
//             ],
//           ))
//         ],
//       ),
//     );
//   }

//   Widget hourlyBoxes() {
//     return Container(
//         margin: EdgeInsets.symmetric(vertical: 0.0),
//         height: 150.0,
//         child: ListView.builder(
//             padding:
//                 const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
//             scrollDirection: Axis.horizontal,
//             itemCount: 2,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                   padding: const EdgeInsets.only(
//                       left: 10, top: 15, bottom: 15, right: 10),
//                   margin: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(18)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 2,
//                           blurRadius: 2,
//                           offset: Offset(0, 1), // changes position of shadow
//                         )
//                       ]),
//                   child: Column(children: [
//                     Text(
//                       "yu°",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17,
//                           color: Colors.black),
//                     ),
//                     // getWeatherIcon(_forecast.hourly[index].icon),
//                     Text(
//                       "ui",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12,
//                           color: Colors.grey),
//                     ),
//                   ]));
//             }));
//   }
// }

  Widget hourlyBoxes() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 150.0,
        child: ListView.builder(
            padding:
                const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: forecast.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, bottom: 15, right: 10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        )
                      ]),
                  child: Column(children: [
                    Text(
                      "${forecast[index]["main"]["temp"].toString()}°",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                    getWeatherIcon(
                        forecast[index]["weather"]["icon"].toString()),
                    Text(
                      "time",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ]));
            }));
  }

  Widget dailyBoxes() {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
            itemCount: forecast.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  margin: const EdgeInsets.all(5),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      forecast[index]["main"]["humidity"].toString(),
                      // "${getDateFromTimestamp(_forcast.daily[index].dt)}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )),
                    Expanded(
                        child: getWeatherIconSmall(
                            forecast[index]["weather"]["icon"].toString())),
                    Expanded(
                        child: Text(
                      forecast[index]["main"]["temp_min"].toString(),
                      // "${_forcast.daily[index].high.toInt()}/${_forcast.daily[index].low.toInt()}",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )),
                  ]));
            }));
  }

  Image getWeatherIcon(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 70,
      height: 70,
    );
  }

  Image getWeatherIconSmall(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 40,
      height: 40,
    );
  }
}
