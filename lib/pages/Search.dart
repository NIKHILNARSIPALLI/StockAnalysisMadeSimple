import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:stock_analysis/pages/homepage.dart';
import 'package:stock_analysis/pages/variables.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

const String heartfilled = '''
<svg viewBox="0.0 0.0 20.1 17.6" ><path transform="translate(0.0, 0.0)" d="M 9.942296028137207 2.814303636550903 C 11.25161838531494 1.449403882026672 12.16863441467285 0.2692150473594666 14.18574619293213 0.03873496875166893 C 17.97313690185547 -0.3960714340209961 21.45649337768555 3.481224298477173 19.54399871826172 7.29803991317749 C 18.99967384338379 8.385055541992188 17.89140892028809 9.678032875061035 16.66545104980469 10.94649028778076 C 15.32016468048096 12.33917999267578 13.83103370666504 13.70407962799072 12.78815269470215 14.7387866973877 L 9.943929672241211 17.56012344360352 L 7.59335994720459 15.29782390594482 C 4.76548433303833 12.57456302642822 0.1542479991912842 9.146784782409668 0.002229224657639861 4.90006685256958 C -0.1040204539895058 1.925075650215149 2.243279933929443 0.01911963894963264 4.943656921386719 0.0534464605152607 C 7.356340885162354 0.08613868057727814 8.371435165405273 1.285942792892456 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 Z" 
fill="#16a512" /></svg>''';

const String heartstroke = '''
<svg viewBox="0.0 0.0 20.1 17.6" ><path transform="translate(0.0, 0.0)" d="M 9.942296028137207 2.814303636550903 C 11.25161838531494 1.449403882026672 12.16863441467285 0.2692150473594666 14.18574619293213 0.03873496875166893 C 17.97313690185547 -0.3960714340209961 21.45649337768555 3.481224298477173 19.54399871826172 7.29803991317749 C 18.99967384338379 8.385055541992188 17.89140892028809 9.678032875061035 16.66545104980469 10.94649028778076 C 15.32016468048096 12.33917999267578 13.83103370666504 13.70407962799072 12.78815269470215 14.7387866973877 L 9.943929672241211 17.56012344360352 L 7.59335994720459 15.29782390594482 C 4.76548433303833 12.57456302642822 0.1542479991912842 9.146784782409668 0.002229224657639861 4.90006685256958 C -0.1040204539895058 1.925075650215149 2.243279933929443 0.01911963894963264 4.943656921386719 0.0534464605152607 C 7.356340885162354 0.08613868057727814 8.371435165405273 1.285942792892456 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 Z" 
fill="none" stroke="#16a512" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>
''';

class _SearchPageState extends State<SearchPage> {
  List<String> data = allstocks;

  void onQueryChanged(String query) {
    setState(() {
      data = allstocks
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleFavorite(String item) {
    setState(() {
      int removeindex = favouritelist.indexOf(item);
      if (favouritelist.contains(item)) {
        favouritelist.remove(item);
        favouritebuyselllist.removeAt(removeindex);
        // Remove item if already in the list
      } else {
        favouritelist.add(item); // Add item if not in the list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(onQueryChanged: onQueryChanged),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          List<String> parts = data[index].split('-');
          //print(index);
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(parts[0]), Text(parts[1])],
                  ),
                ),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      //toggleFavorite(parts[0]);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Add Tag',
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff6BC669)),
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20, right: 5, left: 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xffFF7777)),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(
                                                    130, 50)), // Minimum size
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18.0), // Rounded corners
                                            side: const BorderSide(
                                                color: Color(0xffBA2C2C),
                                                width: 4.0), // Border
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Sell',
                                        style: TextStyle(
                                            fontFamily: 'Nexa',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xffBA2C2C)),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20, right: 10, left: 5),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xffA5FFA3)),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(
                                                    130, 50)), // Minimum size
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18.0), // Rounded corners
                                            side: const BorderSide(
                                                color: Color(0xff6BC669),
                                                width: 4.0), // Border
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'BUY',
                                        style: TextStyle(
                                            fontFamily: 'Nexa',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff6BC669)),
                                      )),
                                ),
                              ],
                            );
                          });
                    },
                    child: SvgPicture.string(
                      favouritelist.contains(parts[0])
                          ? heartfilled
                          : heartstroke,
                      allowDrawingOutsideViewBox: false,
                      fit: BoxFit.fill,
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
