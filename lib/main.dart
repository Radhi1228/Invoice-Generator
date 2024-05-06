import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/app_routes.dart';

void main()
{
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}