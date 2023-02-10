import 'package:cinema/cinema_page.dart';
import 'package:cinema/dio_setting.dart';
import 'package:cinema/imbd_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/imbd_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => ImbdRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => ImbdBloc(
          repo: RepositoryProvider.of<ImbdRepo>(context),
        ),
        child: const MaterialApp(home: Cinema()),
      ),
    );
  }
}
