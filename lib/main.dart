import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main()
{
  runApp(
    BlocProvider
    (
      create: (context)
      {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()
    )
  );
}

class WeatherApp extends StatelessWidget
{
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context)
      {
        return WeatherCubit(WeatherService());
      },
      child: MaterialApp(
        theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
