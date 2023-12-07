import 'package:bloc_architecture/data/models/country.dart';
import 'package:bloc_architecture/logic/blocs/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  final TextEditingController _countryName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Search Country Here :',
              ),
              TextField(
                controller: _countryName,
                textAlign: TextAlign.center,
                onChanged: (String name) {
                  if (name.trim() == "") {
                    BlocProvider.of<CountryBloc>(context)
                        .add(CountryEventInitial());
                  } else {
                    BlocProvider.of<CountryBloc>(context)
                        .add(CountryEventTyping(typing: name));
                  }
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryStateInitial) {
                    return const Text("Type the name of the country above");
                  } else if (state is CountryStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CountryStateData) {
                    return Expanded(
                      child: ListView(children: <Widget>[
                        for (Country c in state.countries)
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(c.name),
                                Text('Official: ${c.official}'),
                                Text('Capital: ${c.capital}'),
                                Text('Region: ${c.region}'),
                                Text('Subregion: ${c.subregion}'),
                                const SizedBox(height: 20)
                              ])
                      ]),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ));
  }
}
