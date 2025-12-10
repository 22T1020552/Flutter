import 'app_entry.dart';

// Import tất cả các screen của bạn
import '../myplace.dart';
import '../travel_booking/travel.dart';
import '../StatefullWidget/mytimer.dart';
import '../StatefullWidget/myregisterform.dart';
import '../StatefullWidget/myloginform.dart';
import '../StatefullWidget/mychangenumber.dart';
import '../StatefullWidget/mychangecolorapp.dart';
import '../screens_login/login_screen.dart';
import '../routing/my_product.dart';
import '../classroom/my_classroom.dart';
import '../hotel/hotel_list_screen.dart';
import '../MyProduct/my_product.dart' as MyProductApp;

final List<AppEntry> allApps = [
  AppEntry(name: "MyPlace", screen: Myplace()),
  AppEntry(name: "MyTravel", screen: MyTravel()),
  AppEntry(name: "MyTimer", screen: MyTimer()),
  AppEntry(name: "RegisterForm", screen: RegisterForm()),
  AppEntry(name: "LoginForm", screen: LoginForm()),
  AppEntry(name: "MyChangeNumber", screen: MyChangeNumber()),
  AppEntry(name: "MyChangeColorApp", screen: MyChangeColorApp()),
  AppEntry(name: "LoginScreen", screen: LoginScreen()),
  AppEntry(name: "MyProduct", screen: MyProduct()),
  AppEntry(name: "MyClassroom1", screen: MyClassroom1()),
  AppEntry(name: "HotelListScreen", screen: HotelListScreen()),
  AppEntry(name: "MyProduct (New)", screen: MyProductApp.MyProduct()),
];
