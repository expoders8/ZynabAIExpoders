import 'package:get/get.dart';

import '../ui/Chat/chat_screen.dart';
import '../ui/ChatWIthAI/chatwithaidoctor.dart';
import '../ui/ChatWIthAIMadicalIsue/chatwithaidoctormaidcal.dart';
import '../ui/TabPage/tabpage.dart';
import '../ui/home/home.dart';
import '../ui/widgets/multipal_sickness.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.tabPage;

  static final routes = [
    GetPage(
      name: _Paths.tabPage,
      page: () => const TabPage(),
    ),
    GetPage(
      name: _Paths.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.chatWithDoctorPage,
      page: () => const ChatWithDoctorPage(),
    ),
    GetPage(
      name: _Paths.multipalSicknessPage,
      page: () => const MultipalSicknessPage(),
    ),
    GetPage(
      name: _Paths.chatWithDoctorMadicalPage,
      page: () => const ChatWithDoctorMadicalPage(),
    ),
    GetPage(
      name: _Paths.userChatPage,
      page: () => const UserChatPage(),
    ),
  ];
}
