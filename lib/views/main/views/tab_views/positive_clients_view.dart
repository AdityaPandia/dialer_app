// import 'package:dialer_shubbhvivah/common/colors.dart';
// import 'package:dialer_shubbhvivah/common/widgets.dart';
// import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
// import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class PositiveClientsView extends StatelessWidget {
//   PositiveClientsView({super.key});
//   final controller = Get.find<MainController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => !controller.isAllProfilesFetched.value
//           ? Center(
//               child: CircularProgressIndicator(
//                 color: CustomColors.pinkColor,
//               ),
//             )
//           : Column(
//               children: [
//                 for (int i = 0;
//                     i < controller.totalFetchedUserDetails.length;
//                     i++) ...[
//                   controller.totalFetchedUserDetails[i].data.basicInfo
//                               .memberStatus ==
//                           0
//                       ? PhoneCard(
//                           onTap: () {
//                             var url = Uri.parse(
//                                 "tel:${controller.totalFetchedUserDetails[i].data.basicInfo.phone}");
//                             launchUrl(url);
//                           },
//                           name: controller.totalFetchedUserDetails[i].data
//                                   .basicInfo.firsName +
//                               " " +
//                               controller.totalFetchedUserDetails[i].data
//                                   .basicInfo.lastName,
//                           phoneNum: controller
//                               .totalFetchedUserDetails[i].data.basicInfo.phone)
//                       : SizedBox(),
//                 ],
//               ],
//             ),
//     );
//   }
// }
