import 'package:extended_image/extended_image.dart';
import 'package:flight/functions/navigator_function.dart';
import 'package:flight/provider/app_data.dart';
import 'package:flight/screens/date_picker.dart';
import 'package:flight/screens/search/search_page.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/utils/global_variable.dart';
import 'package:flight/widgets/primary_button.dart';
import 'package:flight/widgets/ticket_preview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isBusy = false;
  List<String> classList = [
    'Economy',
    'Premium Economy',
    'Business',
    'First Class'
  ];
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppData>(context);
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ColoredBox(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: double.infinity,
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: ColoredBox(
                      color: AppColors.backgroundColor,
                      child: SizedBox(
                          width: double.infinity, height: double.infinity))),
            ],
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.backgroundColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ExtendedImage.network(
                            femaleAvatar,
                            width: 40,
                            height: 40,
                            shape: BoxShape.circle,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome,',
                              style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 12),
                            ),
                            Text(
                              data.userModel!.name!,
                              style: const TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(30, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.secondaryTextColor.withOpacity(0.2))),
                        icon: const Icon(
                          Icons.notifications_rounded,
                          color: AppColors.backgroundColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Securely Book\nyour Flight Tickets',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 26,
                        fontFamily: 'roboto-bold',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FlightSearchCard(data: data, isBusy: isBusy),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Upcoming Flights',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TicketPreviewWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  const TicketPreviewWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightSearchCard extends StatelessWidget {
  const FlightSearchCard({
    super.key,
    required this.data,
    required this.isBusy,
  });

  final AppData data;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5))
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                NavigatorFunctions.navigateTo(
                    context, const SearchPage(title: 'departure'));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          AppColors.secondaryTextColor.withOpacity(0.2),
                      radius: 20,
                      child: ExtendedImage.asset(
                        'assets/icons/plane_takeoff.png',
                        color: AppColors.textColor,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'From',
                          style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          data.selectedDepartureAirport?.name ??
                              'Select Departure',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // select arrival
            GestureDetector(
              onTap: () {
                NavigatorFunctions.navigateTo(
                    context, const SearchPage(title: 'arrival'));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          AppColors.secondaryTextColor.withOpacity(0.2),
                      radius: 20,
                      child: ExtendedImage.asset(
                        'assets/icons/plane_landing.png',
                        color: AppColors.textColor,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'To',
                          style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          data.selectedArrivalAirport?.name ?? 'Select Arrival',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // select departure date and return date
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      NavigatorFunctions.navigateTo(
                          context, const DatePickerScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Departure',
                            style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            data.departureDate == null
                                ? 'Select Departure'
                                : dateFormat.format(data.departureDate!),
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      NavigatorFunctions.navigateTo(
                          context, const DatePickerScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Return',
                            style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            data.returnDate == null
                                ? 'Select Return'
                                : dateFormat.format(data.returnDate!),
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // select passenger
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Passenger',
                        style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        data.passengerCount == 0
                            ? 'Select Passenger'
                            : '${data.passengerCount} Passenger',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  // + and - icon button
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (data.passengerCount > 1) {
                            data.setPassengerCount = data.passengerCount - 1;
                          }
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(30, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.secondaryTextColor.withOpacity(0.3))),
                        icon: const Icon(
                          Icons.remove,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            data.passengerCount.toString(),
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          if (data.passengerCount < 9) {
                            data.setPassengerCount = data.passengerCount + 1;
                          }
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(30, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.secondaryTextColor.withOpacity(0.3))),
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // // dropdown for class
            // GestureDetector(
            //   onTap: () {
            //     // IOS style picker scroll picker
            //     showCupertinoModalPopup<void>(
            //       context: context,
            //       builder: (_) {
            //         final size = MediaQuery.of(context).size;
            //         return Container(
            //           decoration: BoxDecoration(
            //             color: Theme.of(context)
            //                 .scaffoldBackgroundColor,
            //             borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(12),
            //               topRight: Radius.circular(12),
            //             ),
            //           ),
            //           height: size.height * 0.23,
            //           child: CupertinoPicker(
            //             magnification: 1.22,
            //             squeeze: 1.2,
            //             useMagnifier: true,
            //             itemExtent: 40,
            //             // This sets the initial item.
            //             scrollController:
            //                 FixedExtentScrollController(
            //               initialItem: classList.indexOf(
            //                   data.selectedClass ?? ''),
            //             ),
            //             // This is called when selected item is changed.
            //             onSelectedItemChanged:
            //                 (int selectedItem) {
            //               setState(() {
            //                 data.setSelectedClass =
            //                     classList[selectedItem];
            //               });
            //             },
            //             children: List<Widget>.generate(
            //               classList.length,
            //               (int index) {
            //                 return Center(
            //                   child: Text(
            //                     classList[index],
            //                     style: const TextStyle(
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                 );
            //               },
            //             ),
            //           ),
            //         );
            //       },
            //     );
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: 10, vertical: 10),
            //     decoration: BoxDecoration(
            //       color: AppColors.accentColor,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Row(
            //       children: [
            //         Expanded(
            //             child: Column(
            //           crossAxisAlignment:
            //               CrossAxisAlignment.start,
            //           mainAxisAlignment:
            //               MainAxisAlignment.start,
            //           children: [
            //             const Text(
            //               'Class',
            //               style: TextStyle(
            //                   color:
            //                       AppColors.secondaryTextColor,
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             const SizedBox(
            //               height: 2,
            //             ),
            //             Text(
            //               data.selectedClass ?? 'Select Class',
            //               overflow: TextOverflow.ellipsis,
            //               style: const TextStyle(
            //                   color: AppColors.primaryColor,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         )),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         // dropdown icon
            //         IconButton(
            //           onPressed: () {},
            //           style: ButtonStyle(
            //               fixedSize:
            //                   MaterialStateProperty.all<Size>(
            //                       const Size(30, 30)),
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(
            //                       AppColors.secondaryTextColor
            //                           .withOpacity(0.3))),
            //           icon: const Icon(
            //             Icons.arrow_drop_down,
            //             color: AppColors.primaryColor,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // search button
            PrimaryButton(text: 'Search', onPressed: () {}, isBusy: isBusy)
          ],
        ));
  }
}
