import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_latest/newsapp/controller/fetchnews.dart';
import 'package:newsapp_latest/newsapp/views/widgets/Newscontainer.dart';
import 'package:newsapp_latest/newsapp/models/newsArt.dart';
// import 'package:newsapp_latest/group_chat/pages/home_page.dart';
// import 'package:newsapp_latest/group_chat/pages/profile_page.dart';
import 'package:newsapp_latest/screens/user_information_screen.dart';

class newsscreen extends StatefulWidget {
  const newsscreen({Key? key}) : super(key: key);

  @override
  State<newsscreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<newsscreen> {
  bool isLoading = true;
  late int _selectedIndex ;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading ? Center(child: CircularProgressIndicator(),) : NewsContainer(
                imgUrl: newsArt.imgUrl,
                newsCnt: newsArt.newsCnt,
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsUrl: newsArt.newsUrl);
          }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Group Discussion',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.globe),
          label: '3-D',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
        onTap: (index) {
    // Update the currentIndex and navigate to the selected page
    setState(() {
    _selectedIndex = index;
    });
    switch (index) {
    case 0:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    break;
    case 1:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Store()));
    break;
    case 2:
    Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfromationScreen()));
    break;
    }}
    ),
    );
  }
}
