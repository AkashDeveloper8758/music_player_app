import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_nymble/controllers/music_cubit/music_cubit.dart';
import 'package:music_player_nymble/firebase_options.dart';

import 'package:music_player_nymble/presentation/home_screen/music_home_screen.dart';
import 'package:music_player_nymble/repository/music_repository.dart';
import 'package:music_player_nymble/utils/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musical app Nymble',
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          // current implementation of music repository
          create: (context) => MusicHomeCubit(MusicRepositoryImpl()),
        ),
      ], child: const MusicHomeScreen()),
    );
  }
}
