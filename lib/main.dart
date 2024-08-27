import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/chat_room_detail.dart';
import 'package:job_huntly_mobile/pages/recruiter/recruiter_applications.dart';
import 'package:job_huntly_mobile/pages/recruiter/recruiter_chat_rooms.dart';
import 'package:job_huntly_mobile/pages/home.dart';
import 'package:job_huntly_mobile/pages/login.dart';
import 'package:job_huntly_mobile/pages/recruiter/recruiter_company.dart';
import 'package:job_huntly_mobile/pages/recruiter/recruiter_jobs.dart';
import 'package:job_huntly_mobile/pages/recruiter/recruiter_settings.dart';
import 'package:job_huntly_mobile/pages/signup.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider(
    create: (context) => TokenProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(scaffoldBackgroundColor: ColorsConstant.customNeutral),
      home: Consumer<TokenProvider>(
        builder: (context, tokenService, child) {
          return tokenService.token != null ? Home() : Login();
        },
      ),
      onGenerateRoute: (settings) {
        // Parsing the route
        final Uri uri = Uri.parse(settings.name!);

        // Handle static routes
        if (uri.path == Routes.HOME) {
          return MaterialPageRoute(builder: (context) => Home());
        }
        if (uri.path == Routes.LOG_IN) {
          return MaterialPageRoute(builder: (context) => Login());
        }
        if (uri.path == Routes.SIGN_UP) {
          return MaterialPageRoute(builder: (context) => Signup());
        }

        if (uri.path == Routes.RECRUITER_MESSAGES) {
          return MaterialPageRoute(builder: (context) => RecruiterChatRooms());
        }

        if (uri.path == Routes.RECRUITER_COMPANY) {
          return MaterialPageRoute(builder: (context) => RecruiterCompany());
        }

        if (uri.path == Routes.RECRUITER_APPLICATIONS) {
          return MaterialPageRoute(
              builder: (context) => RecruiterApplications());
        }

        if (uri.path == Routes.RECRUITER_JOBS) {
          return MaterialPageRoute(builder: (context) => RecruiterJobs());
        }

        if (uri.path == Routes.RECRUITER_SETTINGS) {
          return MaterialPageRoute(builder: (context) => RecruiterSettings());
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'messages') {
          final id = uri.pathSegments[1]; // Extract the ID
          return MaterialPageRoute(
            builder: (context) => ChatRoomDetail(messageId: id),
          );
        }
      },
    ),
  ));
}
