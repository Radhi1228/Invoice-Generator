import 'package:flutter/material.dart';
import 'package:invoice_generator/screen/contact/contact_screen.dart';
import 'package:invoice_generator/screen/details/detail_screen.dart';
import 'package:invoice_generator/screen/home/home_screen.dart';
import 'package:invoice_generator/screen/invoice/invoice_screen.dart';
import 'package:invoice_generator/screen/splash/spash_screen.dart';

Map<String,WidgetBuilder>app_routes =
{
  "/":(context) => const SplashScreen(),
  "contact":(context) => const ContactScreen(),
  "product":(context) => const ProductScreen(),
  "home":(context) => const HomeScreen(),
  "invoice":(context) => const InvoiceScreen(),
};