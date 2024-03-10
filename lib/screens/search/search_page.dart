import 'package:extended_image/extended_image.dart';
import 'package:flight/firebase/database_function.dart';
import 'package:flight/model/airport_model.dart';
import 'package:flight/provider/app_data.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({super.key, required this.title});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String title = '';
  FocusNode focusNode = FocusNode();
  List<AirportModel> searchResults = [];
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    if (widget.title == 'departure') {
      title = 'Search Departure';
    }
    if (widget.title == 'arrival') {
      title = 'Search Arrival';
    }
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    leading: const BackButton(
                      color: AppColors.backgroundColor,
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
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
                      child: CustomTextField(
                        hintText: 'Search',
                        focusNode: focusNode,
                        controller: _searchController,
                        onChanged: (p0) async {
                          if (p0.isNotEmpty) {
                            setState(() {
                              searchResults =
                                  DatabaseFunctions.searchAirports(p0);
                            });
                          } else {
                            setState(() {
                              searchResults = [];
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: searchResults.length,
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(),
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (widget.title == 'departure') {
                          Provider.of<AppData>(context, listen: false)
                                  .setSelectedDepartureAirport =
                              searchResults[index];
                        }
                        if (widget.title == 'arrival') {
                          Provider.of<AppData>(context, listen: false)
                              .setSelectedArrivalAirport = searchResults[index];
                        }
                        Navigator.pop(context);
                      },
                      child: AirportTile(airportModel: searchResults[index]));
                },
              ))
            ],
          ))
        ],
      ),
    );
  }
}

// class BackButton extends StatelessWidget {
//   const BackButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       style: ButtonStyle(
//           fixedSize: MaterialStateProperty.all<Size>(const Size(30, 30)),
//           backgroundColor: MaterialStateProperty.all<Color>(
//               AppColors.secondaryTextColor.withOpacity(0.2))),
//       icon: const Icon(
//         Icons.arrow_back_rounded,
//         color: AppColors.backgroundColor,
//       ),
//     );
//   }
// }

class AirportTile extends StatelessWidget {
  final AirportModel airportModel;
  const AirportTile({super.key, required this.airportModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //       color: AppColors.primaryColor.withOpacity(0.1),
        //       blurRadius: 10,
        //       spreadRadius: 1,
        //       offset: const Offset(0, 0))
        // ],
      ),
      child: Row(
        children: [
          ExtendedImage.asset(
            'assets/icons/airport.png',
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('(${airportModel.iata})',
                    style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                Text(
                  '${airportModel.city}, ${airportModel.country}',
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  airportModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
