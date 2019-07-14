import 'package:flutter/material.dart';
import 'package:game_myself/class.dart';
import 'package:game_myself/complete.dart';
import 'package:game_myself/di%20it.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<GameButton> buttonList;
  List<String> inputText;
  int count=0, flag=0;
  var player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonList = doinit();
  }
  List<GameButton> doinit(){
    player=new List();
      var gamebuttons = <GameButton>[
      new GameButton(id: 1 ),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4 ),
      new GameButton(id: 5 ),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8 ),
      new GameButton(id: 9),
      new GameButton(id: 10),
      new GameButton(id: 11),
      new GameButton(id: 12 ),
    ];
    return gamebuttons;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("game myself"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:

      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Text("tiles opened: ",style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0, fontWeight: FontWeight.w600),),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: new CircleAvatar(
                  child: Text("$count", style: TextStyle(color: Colors.blue),),
                  backgroundColor: Colors.yellow,
                ),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, i)=>SizedBox(
                child: new RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  child: Text(buttonList[i].text),
                  onPressed: ()=>playGame1(buttonList, i),
                  color: buttonList[i].bg,
                  disabledColor:  buttonList[i].bg,
                ),
              ),
              padding: EdgeInsets.all(10.0),
              itemCount: buttonList.length,
            ),
          ),
          new RaisedButton(
              onPressed: reset,
            child: Text("reset"),
          ),
        ],
      ),
    );
  }
  playGame(GameButton gb, int i) {
    inputText = createList();
    player.add(i);
setState(() {
  if(gb.text=="") {
    gb.text=inputText[i];
    gb.bg=Colors.brown;
    gb.bg=Colors.redAccent;
  }else{
    gb.text="";
    gb.bg=Colors.redAccent;

  }
});

    if(buttonList.every((p)=>p.text!="")){
      showDialog(context: context,
          builder: (_)=> new CustomDialog("complete\n u use $count turns", "press reset to start again", reset));
    }
}
  void reset() {
    count=0;
    if(Navigator.canPop(context))  Navigator.pop(context);
    setState(() {
    buttonList =  doinit();
    });
  }
  playGame1(List<GameButton> list, int i) {
    count++;
    playGame(list[i], i);
    check(list, i);
    }
  void check(List<GameButton> list, int i) {
    if (list[0].text != "" && list[8].text != "") {
      flag=1;
      setState(() {
        list[0].text = "flutter matched";
        list[8].text = "dart matched";
        list[0].bg=Colors.grey;
        list[8].bg=Colors.grey;
        list[0].enabled=false;
        list[8].enabled=false;
      });
    }
    if (list[1].text != "" && list[3].text != "") {
      flag=1;
      setState(() {
        list[1].text = "computer matched";
        list[3].text = "world matched";
        list[1].bg=Colors.grey;
        list[3].bg=Colors.grey;
        list[1].enabled=false;
        list[3].enabled=false;
      });
    }
    if (list[2].text != "" && list[7].text != "") {
      flag=1;
      setState(() {
        list[2].text = "android matched";
        list[7].text = "stdio matched";
        list[2].bg=Colors.grey;
        list[7].bg=Colors.grey;
        list[2].enabled=false;
        list[7].enabled=false;
      });
    }
    if (list[4].text != "" && list[11].text != "") {
      flag=1;
      setState(() {
        list[4].text = "logy matched";
        list[11].text = "techno matched";
        list[4].bg=Colors.grey;
        list[11].bg=Colors.grey;
        list[11].enabled=false;
        list[4].enabled=false;
      });
    }
    if (list[5].text != "" && list[6].text != "") {
      flag=1;
      setState(() {
        list[5].text = "good matched";
        list[6].text = "luck matched";
        list[5].bg=Colors.grey;
        list[6].bg=Colors.grey;
        list[6].enabled=false;
        list[5].enabled=false;
      });
    }
    if (list[9].text != "" && list[10].text != "") {
      flag=1;
      setState(() {
        list[9].text = "hacker matched";
        list[10].text = "start mathed";
        list[9].bg=Colors.grey;
        list[10].bg=Colors.grey;
      });
    }
  }
}

