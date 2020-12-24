
import 'package:flutter/material.dart';
import 'package:lecteurmultimedia/playlist/view/playlist_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar:AppBar(
                centerTitle: true ,
                brightness: Brightness.light,
                title:Text("PLAYLIST",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Regular.ttf",
                    fontSize: 14.0,
                    color: Colors.white,
                  ),),

                flexibleSpace: Image(
                  image: AssetImage("assets/images/nav_bar_back.png"),
                  fit: BoxFit.cover,
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color:Colors.grey),
                actions: [
                  IconButton(icon: new Image.asset("assets/icons/hurt_icon.png"), onPressed: (){
                  }),
                  IconButton(icon: Icon(Icons.more_vert,color: Colors.white,), onPressed: (){
                  }),
                ],

                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity,kToolbarHeight),

                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.0,
                        width: double.infinity,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.3,
                        ),
                      ),
                      TabBar(
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(icon: new Image.asset("assets/icons/home_icon.png"),),
                          Tab(icon: new Image.asset("assets/icons/search_icon.png"),),
                          Tab(icon: new Image.asset("assets/icons/videos_icon.png"),),
                          Tab(icon: new Image.asset("assets/icons/cd_icon.png"),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/back_img.png"),
                      fit: BoxFit.cover,
                    )
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/back_gradient.png"),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: TabBarView(
                    children: [
                      Center(child: Text('DOGS')),
                      Center(child: Text('CATS')),
                      PlayListPage(),
                      Center(child: Text('BIRDS')),
                    ],
                  ),

                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
