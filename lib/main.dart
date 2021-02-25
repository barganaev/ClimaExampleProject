import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services.dart';
import 'weather_model.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
//  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Weather futureAlbum;
  String cityName;
  double temperature;
  String country;
  String text;
  //var myController = TextEditingController();
  @override
  void initState() {
    super.initState();
//    setState(() async {
//      futureAlbum = await fetchAlbum(cityName);
//    });
//    updateUI(widget.locationWeather);
  }
  /*void updateUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null) {
        temperature = 0;
        country = 'No such country';
        text = 'Unable to identify the condition of weather';
        cityName = '';
        return;
      }
      double temp = weatherData['location']['temp_c'];
      temperature = temp.toDouble();
      String condition = weatherData['current']['condition']['text'];
      text = condition.toString();
      cityName = weatherData['location']['name'];
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // keyboard !!!
        // appBar: AppBar(
        //   title: Text('Fetch Data Example'),
        // ),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.white]
                    )
                ),
                child: Column(
                  children: [
                    TextField(
                      //myController = value as TextEditingController;
                      onChanged: (value) {
                        cityName = value;
                      },
                      onSubmitted: (v){
                        setState(() {
                        });
                      },
                      //controller: myController,
                      decoration: InputDecoration(
                          labelText: 'Enter the city name'
                      ),
                    ),
                    Center(
                        child: FutureBuilder<Weather>(
                          future: fetchAlbum(this.cityName),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }
                            if (snapshot.hasData) {
                              final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
                              return Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data.location.name),
                                      Text(snapshot.data.location.country),
                                      Text('${snapshot.data.current.tempC}°', style: TextStyle(fontSize: 20),),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                                        height: MediaQuery.of(context).size.height * 0.25,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: numbers.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    child: Text(index == 0
                                                        ? /*snapshot.data.location.localtime*/ 'Сейчас' : snapshot.data.forecast.forecastday[0].hour[index].time.substring(11, 13)),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Card(
                                                      color: Colors.blue,
                                                      child: Container(
                                                        child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 26.0),)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('${snapshot.data.forecast.forecastday[0].hour[index].tempC}'),
                                                  )
                                                ],
                                              );
                                            }),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * 0.55,
                                        child: SingleChildScrollView(
                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025, right: MediaQuery.of(context).size.width * 0.025),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Скорость ветра в км/ч'),
                                                        Text('${snapshot.data.current.windMph} км/ч'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Скорость ветра в миля/ч'),
                                                        Text('${snapshot.data.current.windKph} м/ч'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Уровень ветра'),
                                                        Text('${snapshot.data.current.windDegree} м'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Направление ветра'),
                                                        Text('${snapshot.data.current.windDir}'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Влажность'),
                                                        Text('${snapshot.data.current.humidity} %'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Миллибар'),
                                                        Text('${snapshot.data.current.pressureMb} миллибар'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Дюйм'),
                                                        Text('${snapshot.data.current.pressureIn} дюйм'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Облачность'),
                                                        Text('${snapshot.data.current.cloud} %'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//
                                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Порыв ветра в км/ч'),
                                                        Text('${snapshot.data.current.gustMph} км/ч'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Порыв ветра в миля/ч'),
                                                        Text('${snapshot.data.current.gustKph} миля/ч'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Направление ветра'),
                                                        Text('${snapshot.data.current.windDir}'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
//                                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.05),
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: Column(
                                                      children: [
                                                        Text('Влажность'),
                                                        Text('${snapshot.data.current.humidity} %'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          },
                        )
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }
}