import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:jokes/features/presentation/bloc/get_jokes_bloc/jokes_bloc.dart';
import 'package:jokes/features/presentation/pages/home/widgets/jokes_list_page.dart';

class HomeSubPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage> {
  Timer? timer;
  List<JokeEntity> jokesList = [];

  @override
  void initState() {
    getJokes();
    timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => getJokes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/unlimit_logo.svg',
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
      ),
      body: BlocListener(
        bloc: BlocProvider.of<GetJokesBloc>(context),
        listener: (context, state) {
          if (state is JokeRetrievedSuccessfullyStatus) {
            setState(() {
              jokesList = state.jokesList;
            });
          }
        },
        child: JokesListPage(jokesList),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getJokes() {
    BlocProvider.of<GetJokesBloc>(context).add(GetJokesEvent());
  }
}
