import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';

class SearchForceView extends StatefulWidget {
  final Function(String)? didSearch;
  const SearchForceView({super.key,this.didSearch });

  @override
  State<SearchForceView> createState() => _SearchForceViewState();
}

class _SearchForceViewState extends State<SearchForceView> {
  TextEditingController txtSearch = TextEditingController();

  List perviousArr = [
    "Search 1",
    "Search 2",
    "Search 3",
    "Search 4",
    "Search 5"
  ];
  List resultArr = [
    "Gross Anatomy",
    "When To Rob A Bank",
    "The Bite In The Apple",
    "The Ignorant Maestro"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: txtSearch,
                  onChanged:(value) {
                      setState(() {
                        
                      });
                  }, 
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: TColor.text),
                    hintText: "Search here",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 17,
                  ),
                ))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(txtSearch.text.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              "Previous Searches",
              style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              itemCount: txtSearch.text.isEmpty ? perviousArr.length : resultArr.length ,
              itemBuilder: (context, index) {
                var searchResultText = ( txtSearch.text.isEmpty ? perviousArr : resultArr )[index] as  String? ?? "";
                return  GestureDetector(
                  onTap: (){
                      if(widget.didSearch != null) {
                        widget.didSearch!(searchResultText);
                      }
                      Navigator.pop(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Row(
                      children: [
                          Icon(Icons.search, color: TColor.subTitle),
                
                          const SizedBox(width: 40,),
                
                          Expanded(child: Text(searchResultText,   style: TextStyle(
                              color: TColor.text,
                              fontSize: 15),
                        )),
                
                         const SizedBox(
                          width: 4,
                        ),
                
                        Text(
                          "times",
                          style: TextStyle(
                              color: TColor.primaryLight,
                              fontSize: 15),
                        )
                
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
