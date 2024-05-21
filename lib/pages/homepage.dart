// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, collection_methods_unrelated_type, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_analysis/pages/Search.dart';
import 'package:stock_analysis/pages/topgainers.dart';
import 'package:stock_analysis/pages/toplosers.dart';
import 'package:stock_analysis/pages/variables.dart';
import 'dart:math';

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(onTap: searchBarOnTap),
      body: ListView(
        shrinkWrap: true,
        children: const <Widget>[
          SizedBox(
            height: 7,
          ),
          GainersLosersTab(),
          SizedBox(
            height: 22,
          ),
          Divider(),
          SizedBox(
            height: 11,
          ),
          favouritestab(),
          SizedBox(
            height: 50,
          ),
          blockdeals()
        ],
      ),
    );
  }

  searchBarOnTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
}

//Block deals Container
class blockdeals extends StatelessWidget {
  const blockdeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            width: 383,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.black),
            child: Center(
              child: Text(
                'BLOCK DEALS',
                style: TextStyle(
                    fontFamily: 'Nexa',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            )),
        Container(
          height: 281,
          width: 382,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 160, top: 5, bottom: 27),
                child: Text(
                  '(LAST UPDATED ON $lastupdatedblockdealsdate)',
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: blockdealsnames.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 11, left: 10, right: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              blockdealsnames[index],
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Text(
                              blockdeapvalues[index],
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

// Favourite Bar
class favouritestab extends StatefulWidget {
  const favouritestab({
    super.key,
  });

  @override
  State<favouritestab> createState() => _favouritestabState();
}

class _favouritestabState extends State<favouritestab> {
  void removeItem(int index) {
    setState(() {
      if (index >= 0 && index < favouritebuyselllist.length) {
        favouritebuyselllist.removeAt(index);
        print('Item at buysell index $index removed successfully');
      } else {
        print('Invalid buysell index: $index');
      }
      if (index >= 0 && index < favouritelist.length) {
        favouritelist.removeAt(index);
        print('Item at index $index removed successfully');
      } else {
        print('Invalid index: $index');
      }
    });
  }

  bool isExpanded = false;

  void toggleShowAllItems() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: favouritelist.isNotEmpty ? 290 : 150,
      width: 373,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 27,
            width: 363,
            child: Row(
              children: [
                Text(
                  'Favourites',
                  style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 18,
                      letterSpacing: 0,
                      color: Color(0xff16A512)),
                ),
                SizedBox(
                  width: 9,
                ),
                SvgPicture.string(
                  '<svg viewBox="0.0 0.0 20.1 17.6" ><path transform="translate(0.0, 0.0)" d="M 9.942296028137207 2.814303636550903 C 11.25161838531494 1.449403882026672 12.16863441467285 0.2692150473594666 14.18574619293213 0.03873496875166893 C 17.97313690185547 -0.3960714340209961 21.45649337768555 3.481224298477173 19.54399871826172 7.29803991317749 C 18.99967384338379 8.385055541992188 17.89140892028809 9.678032875061035 16.66545104980469 10.94649028778076 C 15.32016468048096 12.33917999267578 13.83103370666504 13.70407962799072 12.78815269470215 14.7387866973877 L 9.943929672241211 17.56012344360352 L 7.59335994720459 15.29782390594482 C 4.76548433303833 12.57456302642822 0.1542479991912842 9.146784782409668 0.002229224657639861 4.90006685256958 C -0.1040204539895058 1.925075650215149 2.243279933929443 0.01911963894963264 4.943656921386719 0.0534464605152607 C 7.356340885162354 0.08613868057727814 8.371435165405273 1.285942792892456 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 Z" fill="none" stroke="#16a512" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 234,
                ),
                SvgPicture.asset(
                  'assets/icons/plus-icon.svg',
                  width: 20.09,
                  height: 20.05,
                  color: Color(0xff16A512),
                )
              ],
            ),
          ),
          SizedBox(
            height: 21,
          ),
          favouritelist.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: isExpanded
                          ? favouritelist.length
                          : min(4, favouritelist.length),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 23),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            favouritelist[index],
                                            style: TextStyle(
                                                fontFamily: 'Nexa',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16,
                                                color: Color(0xff6BC669)),
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.string(
                                                '<svg viewBox="23.0 395.3 8.5 8.5" ><path transform="translate(23.0, 395.35)" d="M 6.181366920471191 1.27928352355957 C 6.446341514587402 1.27928352355957 6.686248779296875 1.386774182319641 6.859914779663086 1.560370802879333 C 7.033510208129883 1.734035611152649 7.14100170135498 1.974013566970825 7.14100170135498 2.23898720741272 C 7.14100170135498 2.503960847854614 7.033510684967041 2.743869543075562 6.859914779663086 2.917535066604614 C 6.686248779296875 3.091200113296509 6.446270942687988 3.198622226715088 6.181366920471191 3.198622226715088 C 5.916323661804199 3.198622226715088 5.676415920257568 3.091200113296509 5.502818584442139 2.917535066604614 C 5.329154014587402 2.743869543075562 5.221731662750244 2.503960847854614 5.221731662750244 2.23898720741272 C 5.221731662750244 1.974013566970825 5.329154014587402 1.734035611152649 5.502818584442139 1.560370802879333 C 5.676415920257568 1.38670539855957 5.916323661804199 1.27928352355957 6.181366920471191 1.27928352355957 L 6.181366920471191 1.27928352355957 Z M 8.403690338134766 3.904644727706909 L 3.90457558631897 8.403759002685547 C 3.826626539230347 8.481779098510742 3.700130224227905 8.481779098510742 3.622180700302124 8.403759002685547 L 0.0584622323513031 4.839972496032715 C -0.0194874219596386 4.762091159820557 -0.0194874219596386 4.635663986206055 0.0584622323513031 4.557645797729492 L 4.557576656341553 0.05853111296892166 C 4.596551418304443 0.01955627650022507 4.647645473480225 0 4.698740005493164 0 L 4.698740005493164 0 L 8.145258903503418 0 C 8.255572319030762 0 8.344952583312988 0.08938045799732208 8.344952583312988 0.1996943950653076 C 8.344952583312988 0.2029996663331985 8.344815254211426 0.2063738256692886 8.344676971435547 0.2096790820360184 L 8.461326599121094 3.75714635848999 C 8.463116645812988 3.814300298690796 8.44059944152832 3.866565227508545 8.403140068054199 3.904093980789185 L 8.403690338134766 3.904644727706909 L 8.403690338134766 3.904644727706909 Z M 3.763343811035156 7.980133056640625 L 8.060628890991211 3.682777166366577 L 7.952655792236328 0.3993887901306152 L 4.781509399414062 0.3993887901306152 L 0.4820897579193115 4.698877334594727 L 3.763343811035156 7.980133056640625 L 3.763343811035156 7.980133056640625 Z M 6.627374649047852 1.792911410331726 C 6.513272762298584 1.678810119628906 6.355514049530029 1.60815954208374 6.18129825592041 1.60815954208374 C 6.007082462310791 1.60815954208374 5.849393367767334 1.678741216659546 5.735223293304443 1.792911410331726 C 5.621053695678711 1.907012462615967 5.550402641296387 2.064771175384521 5.550402641296387 2.23898720741272 C 5.550402641296387 2.413203239440918 5.620983600616455 2.570893049240112 5.735223293304443 2.685063123703003 C 5.849323272705078 2.799233198165894 6.007013320922852 2.869815111160278 6.18129825592041 2.869815111160278 C 6.355446338653564 2.869815111160278 6.513205051422119 2.799232959747314 6.627374649047852 2.685063123703003 C 6.741544246673584 2.570893287658691 6.812126636505127 2.413203239440918 6.812126636505127 2.23898720741272 C 6.812126636505127 2.064771175384521 6.741474628448486 1.907012462615967 6.627374649047852 1.792911410331726 L 6.627374649047852 1.792911410331726 Z" fill="#6bc669" stroke="#6bc669" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                favouritebuyselllist[index]
                                                    ? 'BUY'
                                                    : 'SELL',
                                                style: TextStyle(
                                                    fontFamily: 'Nexa',
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 13,
                                                    color: Color(0xff16A512)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 32),
                                      child: GestureDetector(
                                        onTap: () {
                                          removeItem(index);
                                        },
                                        child: Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontFamily: 'Nexa',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w200,
                                            color: Color(0xff16A512),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : Text(
                  'No Favourites',
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff15A512)),
                ),
          GestureDetector(
            onTap: toggleShowAllItems,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded ? 'Less' : 'Expand',
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          color: Color(0xff15A512)),
                    ),
                    SizedBox(
                      width: 4.81,
                    ),
                    SvgPicture.string(
                      isExpanded
                          ? '<svg viewBox="0.0 0.0 4.6 9.1" ><path transform="translate(4.6, -6.55) rotate(90, 2.3, 4.55)" d="M 10.23401165008545 12.46802043914795 L 5.666711807250977 7.900769233703613 L 10.23401165008545 3.333499908447266" fill="none" fill-opacity="0.87" stroke="#15a512" stroke-width="1" stroke-opacity="0.87" stroke-linecap="round" stroke-linejoin="round" /></svg>'
                          : '<svg viewBox="0.0 0.0 4.6 9.1" ><path transform="translate(0, 6.55) rotate(-90, 2.3, 4.55)" d="M 10.23401165008545 12.46802043914795 L 5.666711807250977 7.900769233703613 L 10.23401165008545 3.333499908447266" fill="none" fill-opacity="0.87" stroke="#15a512" stroke-width="1" stroke-opacity="0.87" stroke-linecap="round" stroke-linejoin="round" /></svg>',
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                Divider(
                  color: Color(0xff15A512),
                  thickness: 1,
                  height: 0,
                  indent: 186.5,
                  endIndent: 190.5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Gainers Losers Tab
class GainersLosersTab extends StatelessWidget {
  const GainersLosersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 383,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 23,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => topgainers())));
            },
            child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    color: Color(0xffA5FFA3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xff16A512), width: 3)),
                child: Center(
                  child: Text('TOP GAINERS',
                      style: TextStyle(
                        fontFamily: 'Anton',
                        fontSize: 20,
                        color: Color(0xff16A512),
                      )),
                )),
          ),
          SizedBox(
            width: 23,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => toplosers()));
            },
            child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    color: Color(0xffFF7777),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffBA2C2C), width: 3)),
                child: Center(
                  child: Text('TOP LOSERS',
                      style: TextStyle(
                        fontFamily: 'Anton',
                        fontSize: 20,
                        color: Color(0xffBA2C2C),
                      )),
                )),
          ),
        ],
      ),
    );
  }
}

// Home App Bar
class homeAppBar extends StatelessWidget implements PreferredSizeWidget {
  void Function()? onTap;
  void Function(String)? onQueryChanged;
  homeAppBar({
    super.key,
    this.onTap,
    this.onQueryChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // ignore: duplicate_ignore
      // ignore: prefer_const_constructors
      backgroundColor: Colors.white,
      //titleSpacing: 0,
      title: GestureDetector(
        // on tap change reload homepage
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => myHomePage()));
        },
        child: Container(
          height: 48,
          // ignore: sort_child_properties_last
          child: Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                // Row for "Stock" and "Analysis"
                Row(
                  children: [
                    Text(
                      "STOCK ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff16A512),
                          fontFamily: 'Anton',
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "ANALYSIS",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Anton',
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                // Row for "Made" and "Simple"
                Row(
                  children: [
                    Text(
                      "MADE ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff16A512),
                          fontFamily: 'Anton',
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "SIMPLE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Anton',
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Column(
          children: [
            // This is for the searh box in the app bar
            SearchBar(
              onTap: onTap,
              onQueryChanged: onQueryChanged,
            ),

            //Adding space
            SizedBox(
              height: 9,
            ),

            // This is for the status of market bar
            // ignore: avoid_unnecessary_containers
            Market_Status()
          ],
        ),
      ),
    );
  }
}

// Market status of Home App Bar
class Market_Status extends StatefulWidget {
  //String statustext = 'Market is live';
  //Color marketstatuscolor = Color(0xffEAFFF1);

  const Market_Status({
    super.key,
    //required this.statustext,
    //required this.marketstatuscolor
  });

  @override
  State<Market_Status> createState() => _Market_StatusState();
}

class _Market_StatusState extends State<Market_Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 404,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: marketisonline ? Color(0xffEAFFF1) : Color(0xffC46161),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            marketisonline ? 'Market is live' : 'Market is Closed',
            style: TextStyle(
              fontFamily: 'Anton',
              fontSize: 10,
              color: marketisonline ? Color(0xff16A512) : Colors.white,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          marketisonline
              ? Container(
                  height: 12,
                  width: 22,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/live_icon.png'))),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

// Search Bar of Home App Bar
class SearchBar extends StatefulWidget {
  final void Function()? onTap;
  final void Function(String)? onQueryChanged;
  const SearchBar({
    super.key,
    required this.onTap,
    required this.onQueryChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: SizedBox(
        width: 404,
        height: 47,
        child: TextField(
          onChanged: widget.onQueryChanged,
          decoration: InputDecoration(
            labelText: 'Stock Name / Symbol',
            hintText: 'Search',
            labelStyle: TextStyle(
              fontFamily: 'Sana',
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
