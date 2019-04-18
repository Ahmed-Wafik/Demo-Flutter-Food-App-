import 'package:flutter/material.dart';
import 'package:foods_app/foodlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9EFEB),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(75.0)),
                      color: Color(0xFFFD7465)),
                ),
                Container(
                  height: 185.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(65.0)),
                      color: Color(0xFFFE8A7E)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.0, left: 15.0),
                  child: Text(
                    'Good Afternoon!\nChoose your favorite!',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 160.0, left: 15.0, right: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        )),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Search for your favorite',
                        hintStyle:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
            TabBar(
              controller: tabController,
              indicatorColor: Color(0xFFFE8A7E),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              labelColor: Color(0xFF440206),
              unselectedLabelColor: Colors.grey.shade600,
              tabs: <Widget>[

                TabItem(text: 'DRINKS',),
                TabItem(text: 'BARBECUE',),
                TabItem(text: 'PIZZA',),
                TabItem(text: "DESSERT",)

              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 225,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                   FoodList(),
                   FoodList(),
                   FoodList(),
                   FoodList(),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'RECOMMEND',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            ListItem(
              imgPath: 'assets/steak.png',
              foodName: 'Chocolate lemon cup cake',
              desc:
                  'The sour and sweetness of the lemon neutralizes the sweetness of the cream',
              likes: 120,
              calCount: 5562,
              price: '6-9 per',
              serving: '\$11.0',
            ),
            SizedBox(height: 10.0),
            ListItem(
              imgPath: 'assets/steak.png',
              foodName: 'Strawberry cupcake',
              desc:
                  'Rich in taste, dense in taste, with a bit of bitterness in chocolate, it is a great...',
              likes: 200,
              calCount: 2412,
              price: '2-3 per',
              serving: '\$18.0',
            ),
            SizedBox(height: 20.0)
          ],
        ));
  }
}

class TabItem extends Tab{
  final text;
  TabItem({this.text}) : super(child:Text(
    text,
    style: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15.0,
    ),
  ));
}

