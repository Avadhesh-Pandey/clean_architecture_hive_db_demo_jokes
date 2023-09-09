import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:jokes/core/constants/color_constants.dart';
import 'package:jokes/core/di/injection_getit.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jokes/features/data/datasource/local/db/jokes.dart';
import 'package:jokes/features/presentation/pages/home/home_main_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Init Dependency Inject
  await di.init();

  // Init Hive for DB storage
  if (kIsWeb) {
    _registerHiveAdapters();
  } else {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _registerHiveAdapters();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640),  minTextAdapt: true,  splitScreenMode: true);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColour),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
      ),
      home: const HomePage(),
    );
  }
}

void _registerHiveAdapters() {
  Hive
    .registerAdapter(JokesAdapter());
}