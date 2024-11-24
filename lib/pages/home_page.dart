import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/services/success_body.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is Weather_Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Weather_Success) {
          return SuccessBody(weatherData: state.weatherModel);
        } else if (state is Weather_Error) {
          return Center(
            child: Text("Some thing went wrong"),
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'there is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
