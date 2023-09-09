import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/core/di/injection_getit.dart';
import 'package:jokes/features/presentation/bloc/auth_status/jokes_bloc.dart';
import 'package:jokes/features/presentation/pages/home/subpages/home_subpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetJokesBloc>(),
      child: HomeSubPage(),
    );
  }
}
