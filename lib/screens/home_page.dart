import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool abo = false;
  bool foryou = true;
  bool play = true;
  VideoPlayerController _controller;
  AnimationController animationController;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  PageController foryouController = new PageController();

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 5));
    animationController.repeat();
    _controller = VideoPlayerController.asset('assets/videos/raphael_video.mp4')
      ..initialize().then((value) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            HomeScreen(),
            Footer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {
                      setState(() {
                        abo = true;
                        foryou = false;
                      });
                    },
                    child: Text('Seguindo',
                        style: abo
                            ? TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )
                            : TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))),
                Text('|', style: TextStyle(color: Colors.white, fontSize: 5)),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      abo = false;
                      foryou = true;
                    });
                  },
                  child: Text('Para você',
                    style: foryou
                        ? TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                        : TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  HomeScreen(){
    if(foryou){
      return PageView.builder(
          controller:  foryouController,
          onPageChanged: (index){
            setState(() {
              _controller.seekTo(Duration.zero);
              _controller.play();
            });
          },
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index){
            return Stack(
              children: [
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){
                      setState(() {
                        if(play){
                          _controller.pause();
                          play = !play;
                        } else {
                          _controller.play();
                          play = !play;
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: VideoPlayer(_controller),
                    )),
                Padding(padding: EdgeInsets.only(bottom: 70),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text('@paulofo', style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text.rich(TextSpan(children:
                            <TextSpan>[TextSpan(text:'Dancing on the couch'),
                              TextSpan(text:'#dance\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text:'Veja a tradução',
                                  style: TextStyle(fontSize:12))],
                              style: TextStyle(color: Colors.white, fontSize: 14),)),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.music_note, size: 16, color: Colors.white),
                                Text('La Bamba - Los Lobos', style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),),

                Padding(
                  padding: EdgeInsets.only(bottom: 65, right: 10),
                  child: Container(
                    width: 70,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 23),
                          width: 40,
                          height: 50,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 19,
                                  backgroundColor: Colors.black,
                                  backgroundImage: AssetImage('assets/images/family2.jpg'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Color(0xfd2c58).withOpacity(1),
                                  child: Center(
                                    child: Icon(Icons.add, size: 15, color: Colors.white,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 35, color: Colors.white),
                              Text('347.9', style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child: Icon(Icons.sms,size: 35,color:Colors.white)),
                              Text('7777', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child: Icon(Icons.reply,size: 35,color:Colors.white)),
                              Text('Compartilhar', style: TextStyle(color: Colors.white,fontSize: 10))
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: animationController,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0x222222).withOpacity(1),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage('assets/images/family.jpg'),
                            ),
                          ),
                          builder: (context, _widget){
                            return Transform.rotate(angle: animationController.value*6.3,
                              child: _widget,
                            );
                          },
                        ),
                      ],
                    ),
                  ) ,)
              ],
            );
          });
    } else {
      _controller.play();
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text('Criadores populares',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 20),))
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                              'Siga uma conta para ver seus vídeos mais recentes aqui.',
                              style: TextStyle(color: Colors.white.withOpacity(0.8))
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 372,
              margin: EdgeInsets.only(top: 25),
              child: PageView.builder(
                  dragStartBehavior: DragStartBehavior.down,
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, position){
                    return videoSlider(position);
                  }),
            )
          ],
        ),
      );
    }
  }

  videoSlider(int index){
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget){
        double value = 1;
        if(pageController.position.haveDimensions){
          value = pageController.page - index;
          value = (1-(value.abs()*0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value)*372,
            width:  Curves.easeInOut.transform(value)*300,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: VideoPlayer(_controller),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(padding: EdgeInsets.all(5),
              child: Icon(Icons.close, size: 15, color: Colors.white,),),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 370/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/family2.jpg'),
                      radius: 30,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text('Paulo FO', style: TextStyle(color: Colors.white)),
                  ),
                  Text('@paulofo', style: TextStyle(color: Colors.white.withOpacity(0.5))),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 50, right: 50, top: 12),
                    decoration: BoxDecoration(
                      color: Color(0xfe2b54).withOpacity(1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text('Seguir', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Footer(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
        ),
        Padding(padding: EdgeInsets.only(bottom: 7),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 20, right: 11),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, color: Colors.white, size: 30,),
                    Text('Ínicio', style: TextStyle(color: Colors.white,
                        fontSize: 10),)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 11),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.white.withOpacity(0.8), size: 30,),
                    Text('Descobrir', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 3),
                  child: ButtonPlus()),
              Padding(padding: EdgeInsets.only(left: 10, right: 8),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox, color: Colors.white.withOpacity(0.8), size: 30,),
                    Text('Caixa de entrada', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 9, right: 15),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: Colors.white.withOpacity(0.8), size: 30,),
                    Text('Eu', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ButtonPlus(){
    return Container(
      width: 46,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 28,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0x2dd3e7).withOpacity(1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 28,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xed316a).withOpacity(1),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 28,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(Icons.add, color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
