import 'package:flutter/material.dart';
import '../screens/admin/dashboard_admin_screen.dart';
import '../screens/customer/home_customer_screen.dart';
import '../screens/owner/dashboard_owner_screen.dart';

void navigateToDashboard(BuildContext context, String role) {
  Widget screen;

  switch (role) {
    case 'admin':
      screen = const DashboardAdminScreen();
      break;
    case 'owner':
      screen = const DashboardOwnerScreen();
      break;
    case 'customer':
    default:
      screen = HomeCustomerScreen();
      break;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}
