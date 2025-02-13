import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final textControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textControler.addListener(() => onSearchChanged);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            showTags(),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
            )
          ],
        ),
      ),
    );
  }

  Widget showTags() {
    List<String> tags = [
      "People",
      "Jobs",
      "Content",
      "Companies",
      "Schools",
      "Groups"
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView.builder(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400] ?? Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(5),
            child: Text(tags.elementAt(index)),
          );
        },
      ),
    );
  }

  onSearchChanged() {
    String searchText = textControler.text;
    print(searchText);
    // to do :D
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: TextField(
          controller: textControler,
          autofocus: true,
          onChanged: onSearchChanged(),
          style: const TextStyle(color: Colors.grey),
          decoration: const InputDecoration.collapsed(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      // actions: <Widget>[
      //   Container(
      //       padding: EdgeInsets.all(10),
      //       child: Icon(
      //         FontAwesomeIcons.qrcode,
      //         color: Colors.blue[200],
      //       ))
      // ],
    );
  }
}
