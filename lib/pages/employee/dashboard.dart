import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/components/employee_drawer.dart';
import 'package:job_huntly_mobile/components/recruiter_drawer.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/models/application.dart';
import 'package:job_huntly_mobile/models/application_count.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/provider/user_provider.dart';
import 'package:job_huntly_mobile/service/application_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EmployeeDashBoard extends StatelessWidget {
  const EmployeeDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final currentRoute = Routes.HOME;
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    ApplicationService applicationService = ApplicationService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.customNeutral,
        title: SvgPicture.asset("assets/images/logo.svg"),
      ),
      drawer: EmployeeDrawer(currentRoute: currentRoute),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xin chào, ${user?.data?.fullName ?? "không có người dùng"}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            const Text(
                "Đây là nơi bạn có thể cập nhật được trạng thái mới nhất về đơn ứng tuyển của mình"),
            FutureBuilder<ApplicationCount>(
              future: applicationService.countApplications(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final applicationCount = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            "Tổng số công việc đã ứng tuyển: ",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${applicationCount.data?.total ?? 0}',
                            style: const TextStyle(
                                color: ColorsConstant.customViolet),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Text(
                            "Đang trong quá trình phỏng vấn: ",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${applicationCount.data?.interviewing ?? 0}',
                            style: const TextStyle(
                                color: ColorsConstant.customViolet),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Text('No data available');
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Công việc ứng tuyển gần đây",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            // Wrap the ListView.builder in an Expanded widget
            Expanded(
              child: FutureBuilder<Application>(
                future: applicationService.getApplication(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final applications = snapshot.data!;
                    final contents = applications.data?.content ?? [];

                    if (contents.isEmpty) {
                      return const Text('No applications available');
                    }

                    return ListView.builder(
                      itemCount: contents.length,
                      itemBuilder: (context, index) {
                        final content = contents[index];
                        final logo =
                            content.job?.company?.logo ?? "Unknown Logo";
                        final jobTitle = content.job?.title ?? 'Unknown Job';
                        final companyName =
                            content.job?.company?.name ?? 'Unknown Company';
                        final location = content.job?.company?.location ??
                            'Unknown location';
                        final createdAt = content.createdAt ?? 'Not Scheduled';
                        DateTime dateTime = DateTime.parse(createdAt);

                        // Format the date
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(dateTime);

                        return _jobCard(logo, jobTitle, companyName, location,
                            formattedDate, index % 2 == 0);
                      },
                    );
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _jobCard(String url, String title, String companyName, String location,
    String formattedDate, bool isEven) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    decoration: BoxDecoration(
      color: isEven
          ? Color.fromARGB(255, 238, 238, 252)
          : ColorsConstant.customNeutral,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              url,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [Text(companyName), Text("・"), Text(location)],
        ),
        Text(
          "Ứng tuyển ngày",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(formattedDate)
      ],
    ),
  );
}
