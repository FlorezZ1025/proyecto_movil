import 'package:flutter/material.dart';
import 'package:rappi_u/screens/order_screen.dart';
import 'screens/all_stores_screen.dart';
import 'package:go_router/go_router.dart'; 
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/store_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
     path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/store',
      builder: (context, state) => StoreScreen(),
    )
    ,
    GoRoute(
      path: '/stores',
      builder: (context, state) => AllStoresScreen(),
    ),
    GoRoute(
      path: '/order',
      builder: (context,state)=> OrderScreen(),
      ),

  ],
);
