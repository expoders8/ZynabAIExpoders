import 'package:get/get.dart';
import 'package:zynabaiexpoders/app/ui/Allergies/allergies_detail.dart';

import '../ui/Medications/medications_details.dart';
import '../ui/MyHelth/myhealth.dart';
import '../ui/home/home.dart';
import '../ui/TabPage/tabpage.dart';
import '../ui/Chat/chat_screen.dart';
import '../ui/Auth/SignUp/signup.dart';
import '../ui/Auth/Login/login_doctor.dart';
import '../ui/AiSharePDF/ai_share_pdf.dart';
import '../ui/ChatHistory/chat_history.dart';
import '../ui/Auth/Login/login_patient.dart';
import '../ui/widgets/multipal_sickness.dart';
import '../ui/Appointment/appointment_day.dart';
import '../ui/ChatWIthAI/chatwithaidoctor.dart';
import '../ui/DoctorDetails/doctor_details.dart';
import '../ui/Appointment/appointmentdetails.dart';
import '../ui/PatientDetails/patient_details.dart';
import '../ui/ConsultationFees/consultation_fees.dart';
import '../ui/Auth/ForgotPassword/forgot_password.dart';
import '../ui/MyAppointments/myappointmentsdetail.dart';
import '../ui/FIneDoctorsNearby/general_physician.dart';
import '../ui/FIneDoctorsNearby/fine_doctors_nearby.dart';
import '../ui/AppointmentScheduled/appointment_scheduled.dart';
import '../ui/ChatWIthAI/ChatWithPetients/chet_with_petients.dart';

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
      name: _Paths.loginDoctorPage,
      page: () => const LoginDoctorPage(),
    ),
    GetPage(
      name: _Paths.loginPatientPage,
      page: () => const LoginPatientPage(),
    ),
    GetPage(
      name: _Paths.forgotPasswordPage,
      page: () => const ForgotPasswordPage(),
    ),
    GetPage(
      name: _Paths.signUpPage,
      page: () => const SignUpPage(),
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
      name: _Paths.userChatPage,
      page: () => const UserChatPage(),
    ),
    GetPage(
      name: _Paths.aISharePDFPage,
      page: () => const AISharePDFPage(),
    ),
    GetPage(
      name: _Paths.doctoreDetailsPage,
      page: () => const DoctoreDetailsPage(),
    ),
    GetPage(
      name: _Paths.chatHistoryPage,
      page: () => const ChatHistoryPage(),
    ),
    GetPage(
      name: _Paths.findDoctorNearbyPage,
      page: () => const FindDoctorNearbyPage(),
    ),
    GetPage(
      name: _Paths.generalPhysicianPage,
      page: () => const GeneralPhysicianPage(),
    ),
    GetPage(
      name: _Paths.patientDetailsPage,
      page: () => const PatientDetailsPage(),
    ),
    GetPage(
      name: _Paths.consultationFeesPage,
      page: () => const ConsultationFeesPage(),
    ),
    GetPage(
      name: _Paths.appointmentScheduledPage,
      page: () => const AppointmentScheduledPage(),
    ),
    GetPage(
      name: _Paths.chatWithPetaintsPage,
      page: () => const ChatWithPetaintsPage(),
    ),
    GetPage(
      name: _Paths.myAppointmentDetailPage,
      page: () => const MyAppointmentDetailPage(),
    ),
    GetPage(
      name: _Paths.appointmentDetailsPage,
      page: () => const AppointmentDetailsPage(),
    ),
    GetPage(
      name: _Paths.appointmentDayPage,
      page: () => const AppointmentDayPage(),
    ),
    GetPage(
      name: _Paths.myHealthPage,
      page: () => const MyHealthPage(),
    ),
    GetPage(
      name: _Paths.myAllAllergiesPage,
      page: () => const MyAllAllergiesPage(),
    ),
    GetPage(
      name: _Paths.medicationsDetailsPage,
      page: () => const MedicationsDetailsPage(),
    ),
  ];
}
