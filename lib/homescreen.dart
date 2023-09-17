import 'package:flutter/material.dart';
import 'package:xo_game/game_logic.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 String activeplayer = 'X';
 bool gameOver = false;
 int turn = 0 ;
 String result = '';
 Game game = Game();
 bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
            children: [
              SwitchListTile.adaptive(
                  title: Text("Turn on/off two playes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  value: isSwitched,
                  onChanged: (newval) {
                    setState(() {
                      isSwitched = newval;
                    });
                  },
              ),
              Text("It`s $activeplayer Turn".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(16),
                  crossAxisCount: 3,
                  mainAxisSpacing:8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                  children:
                  List.generate(
                         9,
                        (index) => InkWell(
                          borderRadius: BorderRadius.circular(16),
                      child: Container(
                        child: Text(
                                 Player.playerX.contains(index)?
                                 'X'
                                :Player.playerO.contains(index)?
                                 'O'
                                :'',
                            style: TextStyle(color:
                            Player.playerX.contains(index)?
                            Colors.blue : Colors.pink ,
                                fontSize: 52)
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(16)
                        ),
                      ),
                      onTap: gameOver? null : () => _onTap(index),
                    ),
                  ),
                ),
              ),
              Text("$result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed:() {
                  setState(() {
                  Player.playerX = [];
                  Player.playerO = [];
                  activeplayer = 'X';
                  gameOver = false;
                  turn = 0 ;
                  result = '';
                });
                },
                icon: Icon(Icons.replay),
                label: Text("Repaet the game!"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).splashColor),
                ),
              ),
            ],
          )),
    );
  }

  _onTap(int index) async {
    if((!Player.playerX.contains(index)||
        Player.playerX.isEmpty)&&
        (!Player.playerO.contains(index)||
        Player.playerO.isEmpty)) {
        game.PlayGame(index,activeplayer);
        updatestate();
    }
    if(!isSwitched && !gameOver && turn !=9){
      await game.autoplay(activeplayer);
      updatestate();
    }
  }

  void updatestate() {
     setState(() {
        turn++;
        activeplayer = (activeplayer == 'X')? 'O':'X';
       String winnerplayer = game.CheckWinner() ;
       if(winnerplayer != 'Draw'){
         gameOver = true;
         result = '$winnerplayer is the Winner';
       }else if(!gameOver && turn == 9){
         result = 'Draw';
       }
    });
  }
}
