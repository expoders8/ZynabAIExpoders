part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const homePage = _Paths.homePage;
  static const userChatPage = _Paths.userChatPage;
  static const chatWithDoctorPage = _Paths.chatWithDoctorPage;
  static const multipalSicknessPage = _Paths.multipalSicknessPage;
  static const chatWithDoctorMadicalPage = _Paths.chatWithDoctorMadicalPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const homePage = '/homePage';
  static const userChatPage = '/userChatPage';
  static const chatWithDoctorPage = '/chatWithDoctorPage';
  static const multipalSicknessPage = '/multipalSicknessPage';
  static const chatWithDoctorMadicalPage = '/chatWithDoctorMadicalPage';
}
