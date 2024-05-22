// ignore_for_file: camel_case_types, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_analysis/pages/homepage.dart';
import 'package:stock_analysis/pages/variables.dart';

class topgainers extends StatelessWidget {
  const topgainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TOPGAINERAPPBAR(),
        body: SingleChildScrollView(
            child:
                Column(children: [Divider(), topgainertab(), gainerinfo()])));
  }
}

class gainerinfo extends StatefulWidget {
  final String Symbolvalue;
  final String Namevalue;
  final String Openvalue;
  final String Lastpricevalue;
  final String Dayhighvalue;
  final String Daylowvalue;
  final String Prevclosevalue;
  final String Changevalue;
  final String pChangevalue;
  final String Tottradevolumevalue;
  final String Tottradevaluevalue;
  final String LastupdateTime;

  const gainerinfo({
    super.key,
    this.Symbolvalue = '-a-',
    this.Namevalue = 'NA',
    this.Openvalue = '---',
    this.Lastpricevalue = '---',
    this.Dayhighvalue = '---',
    this.Daylowvalue = '---',
    this.Prevclosevalue = '---',
    this.Changevalue = '---',
    this.pChangevalue = '---',
    this.Tottradevolumevalue = '---',
    this.Tottradevaluevalue = '---',
    this.LastupdateTime = '---',
  });

  @override
  State<gainerinfo> createState() => _gainerinfoState();
}

class _gainerinfoState extends State<gainerinfo> {
  void _reloadPage() {
    setState(() {
      // No state variables are changed, just calling setState to trigger a rebuild
    });
  }

  // Whenever this class runs this cell runs first
  @override
  void initState() {
    super.initState();

    //rebuilding the widget exvery time u visit this widget
    _reloadPage();
  }

  final String heartstroke = '''
  <svg viewBox="0.0 0.0 20.1 17.6" ><path transform="translate(0.0, 0.0)" d="M 9.942296028137207 2.814303636550903 C 11.25161838531494 1.449403882026672 12.16863441467285 0.2692150473594666 14.18574619293213 0.03873496875166893 C 17.97313690185547 -0.3960714340209961 21.45649337768555 3.481224298477173 19.54399871826172 7.29803991317749 C 18.99967384338379 8.385055541992188 17.89140892028809 9.678032875061035 16.66545104980469 10.94649028778076 C 15.32016468048096 12.33917999267578 13.83103370666504 13.70407962799072 12.78815269470215 14.7387866973877 L 9.943929672241211 17.56012344360352 L 7.59335994720459 15.29782390594482 C 4.76548433303833 12.57456302642822 0.1542479991912842 9.146784782409668 0.002229224657639861 4.90006685256958 C -0.1040204539895058 1.925075650215149 2.243279933929443 0.01911963894963264 4.943656921386719 0.0534464605152607 C 7.356340885162354 0.08613868057727814 8.371435165405273 1.285942792892456 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 L 9.942296028137207 2.814303636550903 Z" 
  fill="none" stroke="#000001" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>
  ''';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Click on stock for more information',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Column(
        children: [
          // This is the heading of the stock info table below
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 33,
              width: 382,
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(
                  child: Text(
                'Stock',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nexa',
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              )),
            ),
          ),

          // This container is the border line for the stock info
          Container(
            height: 301,
            width: 382,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Column(
              children: [
                Container(
                    height: 143.5,
                    width: 380,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.5))),
                    child: Row(
                      children: [
                        // This container is for symbol and name
                        Container(
                            height: 142,
                            width: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // This is for the row of Symbol
                                stockinfotextmethod(
                                    'Symbol', widget.Symbolvalue, 13, 7, 13, 0),

                                // This is for the row of Name
                                stockinfotextmethod(
                                    'Name', widget.Namevalue, 0, 0, 13, 0),
                              ],
                            )),

                        // This container is for showing the favourite tag if any
                        Container(
                          height: 142,
                          width: 100,
                          //color: Colors.grey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // This the tag
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        right: 6,
                                        left: 6,
                                        bottom: 100),
                                    child: favouritelist
                                            .contains(widget.Namevalue)
                                        ? Container(
                                            height: 28,
                                            width: 99,
                                            decoration: BoxDecoration(
                                                color: favouritebuyselllist[
                                                            favouritelist
                                                                .indexOf(widget
                                                                    .Namevalue)] ==
                                                        true
                                                    ? const Color(0xff049501)
                                                    : const Color(0xffAF0000),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.string(
                                                  '<svg viewBox="332.0 589.9 9.0 9.0" ><path transform="translate(332.04, 589.9)" d="M 6.594789981842041 1.364844679832458 C 6.877486228942871 1.364844679832458 7.133439540863037 1.479524493217468 7.318721294403076 1.664731502532959 C 7.503927707672119 1.850011825561523 7.618607521057129 2.106039524078369 7.618607521057129 2.388735294342041 C 7.618607521057129 2.671431303024292 7.503928184509277 2.927385330200195 7.318721294403076 3.112665891647339 C 7.133439540863037 3.297945737838745 6.87741231918335 3.41255259513855 6.594789981842041 3.41255259513855 C 6.312020778656006 3.41255259513855 6.05606746673584 3.297945737838745 5.870859622955322 3.112665891647339 C 5.685579299926758 2.927385330200195 5.570972442626953 2.671431303024292 5.570972442626953 2.388735294342041 C 5.570972442626953 2.106039524078369 5.685579299926758 1.850011825561523 5.870859622955322 1.664731502532959 C 6.05606746673584 1.479451179504395 6.312020778656006 1.364844679832458 6.594789981842041 1.364844679832458 L 6.594789981842041 1.364844679832458 Z M 8.96574878692627 4.16579532623291 L 4.165722370147705 8.9658203125 C 4.082559108734131 9.049057960510254 3.947602987289429 9.049057960510254 3.864439487457275 8.9658203125 L 0.06237214431166649 5.163679599761963 C -0.02079087495803833 5.08059024810791 -0.02079087495803833 4.945706844329834 0.06237214431166649 4.862471103668213 L 4.862397193908691 0.06244579702615738 C 4.90397834777832 0.02086424082517624 4.95849084854126 0 5.013001918792725 0 L 5.013001918792725 0 L 8.690031051635742 0 C 8.807723045349121 0 8.903080940246582 0.09535840898752213 8.903080940246582 0.2130503952503204 C 8.903080940246582 0.2165767252445221 8.902935028076172 0.2201765477657318 8.902788162231445 0.2237028777599335 L 9.027237892150879 4.008431911468506 C 9.029149055480957 4.069408893585205 9.005125045776367 4.125169277191162 8.965160369873047 4.165207862854004 L 8.96574878692627 4.16579532623291 L 8.96574878692627 4.16579532623291 Z M 4.015044212341309 8.513860702514648 L 8.599740982055664 3.929089546203613 L 8.48454761505127 0.4261007905006409 L 5.101307392120361 0.4261007905006409 L 0.5143328905105591 5.013148307800293 L 4.015044212341309 8.513860702514648 L 4.015044212341309 8.513860702514648 Z M 7.070627212524414 1.912825107574463 C 6.948895454406738 1.79109263420105 6.780584812164307 1.715716600418091 6.594717502593994 1.715716600418091 C 6.408850193023682 1.715716600418091 6.240613460540771 1.791018843650818 6.118806838989258 1.912825107574463 C 5.997001647949219 2.034557580947876 5.92162561416626 2.20286750793457 5.92162561416626 2.388735294342041 C 5.92162561416626 2.574603319168091 5.996927738189697 2.742839574813843 6.118806838989258 2.864645719528198 C 6.24053955078125 2.986452102661133 6.40877628326416 3.061753988265991 6.594717502593994 3.061753988265991 C 6.78051233291626 3.061753988265991 6.948821544647217 2.986451864242554 7.070627212524414 2.864645719528198 C 7.192433834075928 2.742840051651001 7.267735958099365 2.574603319168091 7.267735958099365 2.388735294342041 C 7.267735958099365 2.20286750793457 7.192359924316406 2.034557580947876 7.070627212524414 1.912825107574463 L 7.070627212524414 1.912825107574463 Z" fill="#ffffff" stroke="#ffffff" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                  fit: BoxFit.fill,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  favouritebuyselllist[favouritelist
                                                              .indexOf(widget
                                                                  .Namevalue)] ==
                                                          true
                                                      ? 'Buy'
                                                      : 'Sell',
                                                  style: const TextStyle(
                                                      fontFamily: 'Nexa',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ))
                                        : (widget.Symbolvalue != '---'
                                            ? addfavouritetopgainers(
                                                context, widget.Namevalue)
                                            : null))
                              ]),
                        )
                      ],
                    )),

                //From here second rectagle starts,
                Row(
                  children: [
                    // This container is for the left bottom table
                    Container(
                      height: 155.5,
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First line of the left bottom rectangle
                          stockinfotextmethod('Open            ',
                              widget.Openvalue, 20, 0, 11.5, 0),
                          stockinfotextmethod('Last Price   ',
                              widget.Lastpricevalue, 3, 0, 11.5, 0),

                          //Gap as per design
                          stockinfotextmethod('Day High     ',
                              widget.Dayhighvalue, 24, 0, 11.5, 0),
                          stockinfotextmethod('Day Low      ',
                              widget.Daylowvalue, 0, 0, 11.5, 0),
                          stockinfotextmethod('Prev. Close ',
                              widget.Prevclosevalue, 0, 0, 11.5, 0)
                        ],
                      ),
                    ),

                    // This container is for the right bottom table
                    Container(
                      height: 155.5,
                      width: 190,
                      decoration: const BoxDecoration(
                          border: Border(
                              left:
                                  BorderSide(color: Colors.black, width: 0.5))),
                      child: Column(
                        children: [
                          // First line of right bottom table
                          stockinfotextmethod(
                              'Change     ', widget.Changevalue, 20, 0, 8, 0),
                          stockinfotextmethod(
                              'pChange   ', widget.pChangevalue, 3, 0, 8, 0),

                          //gap as per design
                          stockinfotextmethod('Tot. Trad Volume   ',
                              widget.Tottradevolumevalue, 24, 0, 5, 0),
                          stockinfotextmethod('Tot. Trad Value       ',
                              widget.Tottradevaluevalue, 0, 0, 5, 0),
                          stockinfotextmethod('Last Update Time  ',
                              widget.LastupdateTime, 0, 0, 5, 0)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }

  // This adds the ability to add the stock to favourite
  GestureDetector addfavouritetopgainers(
      BuildContext context, String stockname) {
    return GestureDetector(
      onTap: () {
        //toggleFavorite(parts[0]);
        addfavouritepopup(context, stockname);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 5, bottom: 5, right: 0),
          child: SvgPicture.asset(
            'assets/icons/heart-icon.svg',
            allowDrawingOutsideViewBox: false,
            fit: BoxFit.contain,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }

  // This method shows pop up to add a tag for adding an item to the list
  Future<dynamic> addfavouritepopup(BuildContext context, String stockname) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Add Tag',
              style: TextStyle(
                  fontFamily: 'Nexa',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 58, 54, 54)),
            ),
            content: Text(
              stockname,
              style: const TextStyle(
                  fontFamily: 'Nexa',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, right: 5, left: 10),
                    child: TextButton(
                        onPressed: () {
                          // Add stockname to favourite list with buysell boolean value set to false = SELL
                          favouritelist.add(stockname);
                          favouritebuyselllist.add(false);
                          Navigator.pop(context);
                          _reloadPage();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 162, 11, 11),
                          ),

                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(100, 30)), // Minimum size
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5.0), // Rounded corners
                              side: const BorderSide(
                                  color: Color.fromARGB(177, 186, 44, 44),
                                  width: 2.5), // Border
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Sell',
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, right: 10, left: 5),
                    child: TextButton(
                        onPressed: () {
                          // Add stockname to favourite list with buysell boolean value set to true = Buy
                          favouritelist.add(stockname);
                          favouritebuyselllist.add(true);
                          Navigator.pop(context);
                          _reloadPage();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 4, 149, 1)),

                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(100, 30)), // Minimum size
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5.0), // Rounded corners
                              side: const BorderSide(
                                  color: Color(0xff6BC669),
                                  width: 2.5), // Border
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
            ],
          );
        });
  }

  // This method will return a string that can be directly placed in the stock info table
  Padding stockinfotextmethod(
      String headingvalue,
      String textvalue,
      double topvalue,
      double bottomvalue,
      double leftvalue,
      double rightvalue) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftvalue,
          right: rightvalue,
          top: topvalue,
          bottom: bottomvalue),
      child: Row(
        children: [
          Text(
            '$headingvalue :',
            style: const TextStyle(
              fontFamily: 'Nexa',
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          Text(
            textvalue,
            style: const TextStyle(
              fontFamily: 'Nexa',
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}

// top gainers tab

class topgainertab extends StatelessWidget {
  const topgainertab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.5),
      child: Column(
        children: [
          Container(
            height: 33,
            width: 404,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                border: Border.all(color: const Color(0xff16A512), width: 2.0)),
            child: const Center(
              child: Text(
                'TOP GAINERS',
                style: TextStyle(
                    fontFamily: 'Anton',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                    color: Color(0xff16A512)),
              ),
            ),
          ),
          Container(
              height: 285,
              width: 404,
              decoration: BoxDecoration(
                  color: const Color(0xffA5FFA3),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  border:
                      Border.all(color: const Color(0xff16A512), width: 3.0)),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topgainerslist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 56,
                        width: 404,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xff57CE53)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              topgainerslist[index][0],
                              style: const TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff16A512)),
                            ),
                            Text(
                              topgainerslist[index][1],
                              style: const TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff16A512)),
                            ),
                            Text(
                              topgainerslist[index][2],
                              style: const TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff16A512)),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
          Container(
            height: 10,
          )
        ],
      ),
    );
  }
}

// App Bar

class TOPGAINERAPPBAR extends StatelessWidget implements PreferredSizeWidget {
  const TOPGAINERAPPBAR({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: 48,
        // ignore: sort_child_properties_last
        child: const Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
      automaticallyImplyLeading: false,
      actions: const [
        BackButton(
          color: Color(0xff16A512),
          style: ButtonStyle(
              iconSize: MaterialStatePropertyAll(25),
              minimumSize: MaterialStatePropertyAll(Size(7.88, 15.76)),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.only(right: 20, top: 10))),
        )
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Market_Status(),
      ),
    );
  }
}
