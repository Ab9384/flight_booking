import 'package:flight/provider/app_data.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/utils/global_variable.dart';
import 'package:flight/widgets/dot_with_plane_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppData>(context);
    return Scaffold(
        body: Stack(
      children: [
        const Column(
          children: [
            ColoredBox(
              color: AppColors.primaryColor,
              child: SizedBox(
                height: 180,
                width: double.infinity,
              ),
            ),
            Expanded(
                flex: 4,
                child: ColoredBox(
                    color: AppColors.backgroundColor,
                    child: SizedBox(
                        width: double.infinity, height: double.infinity))),
          ],
        ),
        SafeArea(
          child: Column(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all<Size>(const Size(30, 30)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.secondaryTextColor.withOpacity(0.2))),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  title: const Text(
                    'Select Date',
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Departure',
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.departureDate != null
                                ? dateFormat.format(data.departureDate!)
                                : 'Select Date',
                            style: const TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 16,
                              fontFamily: 'roboto-bold',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(child: DotWithPlaneIconWhite()),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Return',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.returnDate != null
                              ? dateFormat.format(data.returnDate!)
                              : 'Select Date',
                          style: const TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 16,
                            fontFamily: 'roboto-bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  enableMultiView: true,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  navigationMode: DateRangePickerNavigationMode.scroll,
                  enablePastDates: false,
                  initialSelectedRange: PickerDateRange(
                    data.departureDate ?? DateTime.now(),
                    data.returnDate ?? DateTime.now(),
                  ),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      debugPrint(
                          'Date Range: ${args.value.startDate} - ${args.value.endDate}');
                      if (args.value.startDate != null) {
                        data.setDepartureDate = dateFormat
                            .parse(dateFormat.format(args.value.startDate));
                      }
                      if (args.value.endDate != null) {
                        data.setReturnDate = dateFormat
                            .parse(dateFormat.format(args.value.endDate));
                      }
                    }
                  },
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
