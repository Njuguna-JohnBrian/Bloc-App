import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather/blocs/covid_bloc/covid_bloc.dart';
import 'package:bloc_weather/models/covid_model.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();

  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COVID-19",
        ),
      ),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container(
                  color: Colors.red,
                );
              } else {
                return Container(
                  color: Colors.red,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Country: ${model.countries?[index].country}",
                  ),
                  Text(
                    'Total Confirmed: ${model.countries?[index].totalConfirmed}',
                  ),
                  Text(
                    'Total Confirmed: ${model.countries?[index].totalDeaths}',
                  ),
                  Text(
                    "Total Recovered:${model.countries?[index].totalRecovered}",
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );


}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CovidPage(),
          ),
        );
      },
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.limeAccent),
        const Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.medical_information,
            color: Colors.red,
            size: 90,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        )
      ],
    );
  }
}