import 'package:findly/UI/Auth/StudentScreen/student_viewmodel.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommoadtionFilter/accommodation_filter_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/accomodation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/CampusFriendSection/View/CampusFriendfilter/campusfriend_filter_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGraphyReviewScreen/photography_reviewscreen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/home_screen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/marketplacehome_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/SellItem/marketplace_sellitem_viewmodel.dart';
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
  ChangeNotifierProvider(create: (_) => CampusfriendFilterViewmodel()),
  ChangeNotifierProvider(create: (_) => MarketplacehomeViewmodel()),
  ChangeNotifierProvider(create: (_) => PhotographyHomeviewmodel()),
  ChangeNotifierProvider(create: (_) => MarketplaceSellitemViewmodel()),
  ChangeNotifierProvider(create: (_) => PhotographyReviewscreenViewmodel()),
];
