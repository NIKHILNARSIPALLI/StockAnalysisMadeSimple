// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:stock_analysis/pages/homepage.dart';
import 'package:stock_analysis/pages/variables.dart';

class topgainers extends StatelessWidget {
  const topgainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TOPGAINERAPPBAR(),
        body: Column(children: [Divider(), topgainertab()]));
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
  const TOPGAINERAPPBAR({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(95);

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
