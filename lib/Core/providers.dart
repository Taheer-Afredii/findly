import 'package:findly/UI/Auth/StudentScreen/student_viewmodel.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/View/AccommoadtionFilter/accommodation_filter_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/View/Accommodation/accomodation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/home_screen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/profileviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => StudentViewmodel()),
  ChangeNotifierProvider(create: (_) => HomeScreenViewmodel()),
  ChangeNotifierProvider(create: (_) => ProfileViewmodel()),
  ChangeNotifierProvider(create: (_) => AccomodationViewmodel()),
  ChangeNotifierProvider(create: (_) => AccommodationFilterViewmodel()),
];
