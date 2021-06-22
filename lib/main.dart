import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  TabController tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    tabController.addListener(handleTabSelection);
  }

  void handleTabSelection(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text('Dream11',
          style: TextStyle(
            fontSize: 22
          ),
          ),
          actions: [
            Padding(padding: const EdgeInsets.all(8),
              child: Icon(Icons.notifications),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(child: Text('CRICKET')),
              Tab(child: Text('FOOTBALL')),
              Tab(child: Text('HOCKEY')),
              Tab(child: Text('BASKETBALL')),
              Tab(child: Text('KABBADI')),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              DefaultTabController(
                length: 3,
                child: Container(
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        indicatorColor: Colors.red,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(child: Text('FIXTURES')),
                          Tab(child: Text('LIVE')),
                          Tab(child: Text('RESULTS')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Fixture(),
                    Fixture(),
                    Fixture(),
                    Fixture(),
                    Fixture(),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              // ignore: deprecated_member_use
              title: new Text('HOME',style:
                TextStyle(color: Colors.black)
                ,),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black,),
                // ignore: deprecated_member_use
              title: new Text('MY CONTEST',style:
              TextStyle(color: Colors.black)
                ,),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, color: Colors.black,),
              // ignore: deprecated_member_use
              title: new Text('ME',
              style: TextStyle(
                color: Colors.black
              ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined, color: Colors.black,),
              // ignore: deprecated_member_use
              title: new Text('MORE'),
            )
          ],
        ),
      ),
    );
  }
}


class Fixture extends StatefulWidget {
  const Fixture({Key key}) : super(key: key);

  @override
  _FixtureState createState() => _FixtureState();
}

class _FixtureState extends State<Fixture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(7),
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5
        ),
        borderRadius:  BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 16.0,
                spreadRadius: 0.5,
                offset: Offset(0.7,0.7)

            )
          ]
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
            Image.asset('assets/images/india.png',scale: 8,),
          SizedBox(width: 40,),
            Column(
              children: [
                Text('ICC Test C\'ship'),
                SizedBox(height: 25,),
                Text('VS'),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Icon(Icons.timer,color: Colors.red,),
                    SizedBox(width: 2,),
                    Text('26h 44m 54s',
                    style: TextStyle(color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          SizedBox(width: 40,),
          Image.asset('assets/images/nz.png',
          scale: 15,),

        ],
      ),
    );
  }
}
