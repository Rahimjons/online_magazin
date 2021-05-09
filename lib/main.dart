import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_magazine/models/card.dart';
import 'package:online_magazine/models/product.dart';
import 'package:online_magazine/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context)=> ProductDataProvider(),
        ),
        ChangeNotifierProvider<CardDataProvider>(
          create: (context) => CardDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MONRO app",
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white38,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
