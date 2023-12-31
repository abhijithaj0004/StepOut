import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stepout/businesslogic/addresscubit/address_cubit.dart';
import 'package:stepout/businesslogic/carttotalamountcubit/cart_total_amount_cubit.dart';
import 'package:stepout/businesslogic/hidepassword/hide_password_cubit.dart';
import 'package:stepout/businesslogic/productdetails/productdetail_cubit.dart';
import 'package:stepout/businesslogic/quantitycubit/quantity_cubit.dart';
import 'package:stepout/businesslogic/search/search_product_cubit.dart';
import 'package:stepout/businesslogic/wishlist/wish_list_cubit.dart';
import 'package:stepout/firebase_options.dart';
import 'package:stepout/presentation/screens/splashscreen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HidePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => SearchProductCubit(),
        ),
        BlocProvider(
          create: (context) => WishListCubit(),
        ),
        BlocProvider(
          create: (context) => ProductdetailCubit(),
        ),
        BlocProvider(
          create: (context) => QuantityCubit(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(),
        ),
        BlocProvider(
          create: (context) => CartTotalAmountCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: SplashScreen(),
      ),
    );
  }
}
