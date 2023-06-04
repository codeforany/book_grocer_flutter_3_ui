import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extenstion.dart';

class BookReadingView extends StatefulWidget {
  final Map bObj;
  const BookReadingView({super.key, required this.bObj});

  @override
  State<BookReadingView> createState() => _BookReadingViewState();
}

class _BookReadingViewState extends State<BookReadingView> {
  double fontSize = 20;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  isDark ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                widget.bObj["name"].toString(),
                style: TextStyle(
                    color:  isDark ? Colors.white : TColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Switch(
                      activeColor: TColor.primary,
                      value: isDark , onChanged:(value) {
                        setState(() {
                          isDark = value;
                        });
                    },),

                    Text("Dark ", style: TextStyle(color: isDark ? Colors.white : TColor.text , fontWeight: FontWeight.bold ), ),

                    

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          builder: (context) {
                            var orientation = MediaQuery.of(context).orientation;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: orientation == Orientation.portrait
                                      ? 25
                                      : 60),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: TColor.text,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.text_decrease,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                              updateUi();
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.text_increase,
                                        color: TColor.text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: TColor.textbox,
                                        border: Border.all(
                                            color: Colors.black26, width: 0.5),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: const Text("Font"),
                                      underline: Container(),
                                      items: ["Font1", "Font2"].map((name) {
                                        return DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        );
                                      }).toList(),
                                      onChanged: (selectVal) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.portraitDown,
                                            DeviceOrientation.portraitUp
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.portrait
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_portrait,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.landscapeLeft,
                                            DeviceOrientation.landscapeRight
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.landscape
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_landscape,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.settings,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            )
          ];
        },
       
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: SelectableText(
              """
SHORTLY AFTER DARK ON THE AFTERNOON OF DECEMBER 5, 1997, an urgent message was relayed to a man named Yuri Trush at his home in Luchegorsk, a mid-sized mining town in Primorye Territory in Russia’s Far East, not far from the Chinese border. Primorye (Pri-mor-
ya) is, among other things, the last stronghold of the Siberian tiger, and the official on the line had some disturbing news: a man had been attacked near Sobolonye, a small logging community located in the deep forest, sixty miles northeast of Luchegorsk. Yuri Trush was the squad leader of an Inspection Tiger unit, one of six in the territory whose purpose was to investigate forest crimes, specifically those involving tigers.

     Because poachers were often involved, these included tiger attacks. As a result, this situation—whatever it might entail—was now Trush’s problem and, right away, he began preparing for the trip to Sobolonye.

     Early the following morning—Saturday—Yuri Trush, along with his squadmates Alexander Gorborukov and Sasha Lazurenko, piled into a
surplus army truck and rumbled north. Dressed in insulated fatigues and camouflage, and armed with knives, pistols, and semiautomatic rifles, the Tigers, as these inspectors are sometimes called, looked less like game wardens than like some kind of wilderness SWAT team. Their twenty-year-old truck was nicknamed a Kung, and it was the Russian army’s four-ton equivalent to the Unimog and the Humvee. Gasoline-powered,
with a winch, four-wheel-drive, and wide waist-high tires, it is a popular vehicle in Primorye’s hinterlands.

     Along with a gun rack and brackets for
extra fuel cans, this one had been modified to accommodate makeshift bunks, and was stocked with enough food to last four men a week.
""",
              style: TextStyle(color: isDark ? Colors.white : TColor.text, fontSize: fontSize),
            ),
          ),
      ),
    );
  }

  void updateUi(){
    setState(() {
      
    });
  }
}
