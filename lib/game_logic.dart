import 'dart:math';
class Player{
static String x = 'X';
static String o = 'O';
static String empty = '';
static List<int>playerX = [];
static List<int>playerO = [];

}
extension containsAll on List{
   bool containsall(int x,int y,[z]){
    if(z==null) {
      return this.contains(x) && this.contains(y);
    }
    else{
      return this.contains(x) && this.contains(y) && this.contains(z);
    }
  }
}
class Game{
  void PlayGame(int index, String activeplayer) {
    if(activeplayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }
  String CheckWinner(){
    String winner = '';
    if( (Player.playerX.containsall(0,1,2)||
        Player.playerX.containsall(3,4,5)||
        Player.playerX.containsall(6,7,8)||
        Player.playerX.containsall(0,3,6)||
        Player.playerX.containsall(1,4,7)||
        Player.playerX.containsall(2,5,8)||
        Player.playerX.containsall(0,4,8)||
        Player.playerX.containsall(2,4,6))
    ) {
      winner = 'X';
    }
   else if((Player.playerO.containsall(0,1,2)||
        Player.playerO.containsall(3,4,5)||
        Player.playerO.containsall(6,7,8)||
        Player.playerO.containsall(0,3,6)||
        Player.playerO.containsall(1,4,7)||
        Player.playerO.containsall(2,5,8)||
        Player.playerO.containsall(0,4,8)||
        Player.playerO.containsall(2,4,6))
    ) {
      winner = 'O';
    }
    else {
      winner = 'Draw';
    }
    return winner ;
   }
  Future<void> autoplay(activeplayer) async {
    int index =0;
    List<int> emptycells = [];
    for(var i = 0;i<9;i++) {
      if(!(Player.playerX.contains(i)||Player.playerO.contains(i))) {
        emptycells.add(i);
      }
    }


    //start - center
    if((Player.playerO.containsall(0,1) && emptycells.contains(2))){
      index = 2;
    }
    else if((Player.playerO.containsall(3,4) && emptycells.contains(5))){
      index = 5;
    }
    else if((Player.playerO.containsall(6,7) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerO.containsall(0,3) && emptycells.contains(6))){
      index = 6;
    }
    else if((Player.playerO.containsall(1,4) && emptycells.contains(7))){
      index = 7;
    }
    else if((Player.playerO.containsall(2,5) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerO.containsall(0,4) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerO.containsall(2,4) && emptycells.contains(6))){
      index = 6;
    }


    //start - end
    else if((Player.playerO.containsall(0,2) && emptycells.contains(1))){
      index = 1;
    }
    else if((Player.playerO.containsall(3,5) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerO.containsall(6,8) && emptycells.contains(7))){
      index = 7;
    }
    else if((Player.playerO.containsall(0,6) && emptycells.contains(3))){
      index = 3;
    }
    else if((Player.playerO.containsall(1,7) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerO.containsall(2,8) && emptycells.contains(5))){
      index = 5;
    }
    else if((Player.playerO.containsall(0,8) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerO.containsall(2,6) && emptycells.contains(4))){
      index = 4;
    }


    //center - end
    else if((Player.playerO.containsall(1,2) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerO.containsall(4,5) && emptycells.contains(3))){
      index = 3;
    }
    else if((Player.playerO.containsall(7,8) && emptycells.contains(6))){
      index = 6;
    }
    else if((Player.playerO.containsall(3,6) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerO.containsall(4,7) && emptycells.contains(1))){
      index = 1;
    }
    else if((Player.playerO.containsall(5,8) && emptycells.contains(2))){
      index = 2;
    }
    else if((Player.playerO.containsall(4,8) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerO.containsall(4,6) && emptycells.contains(2))){
      index = 2;
    }




    //start - center
    else if((Player.playerX.containsall(0,1) && emptycells.contains(2))){
      index = 2;
    }
    else if((Player.playerX.containsall(3,4) && emptycells.contains(5))){
      index = 5;
    }
    else if((Player.playerX.containsall(6,7) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerX.containsall(0,3) && emptycells.contains(6))){
      index = 6;
    }
    else if((Player.playerX.containsall(1,4) && emptycells.contains(7))){
      index = 7;
    }
    else if((Player.playerX.containsall(2,5) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerX.containsall(0,4) && emptycells.contains(8))){
      index = 8;
    }
    else if((Player.playerX.containsall(2,4) && emptycells.contains(6))){
      index = 6;
    }

      //start - end
    else if((Player.playerX.containsall(0,2) && emptycells.contains(1))){
      index = 1;
    }
    else if((Player.playerX.containsall(3,5) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerX.containsall(6,8) && emptycells.contains(7))){
      index = 7;
    }
    else if((Player.playerX.containsall(0,6) && emptycells.contains(3))){
      index = 3;
    }
    else if((Player.playerX.containsall(1,7) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerX.containsall(2,8) && emptycells.contains(5))){
      index = 5;
    }
    else if((Player.playerX.containsall(0,8) && emptycells.contains(4))){
      index = 4;
    }
    else if((Player.playerX.containsall(2,6) && emptycells.contains(4))){
      index = 4;
    }


    //center - end
    else if((Player.playerX.containsall(1,2) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerX.containsall(4,5) && emptycells.contains(3))){
      index = 3;
    }
    else if((Player.playerX.containsall(7,8) && emptycells.contains(6))){
      index = 6;
    }
    else if((Player.playerX.containsall(3,6) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerX.containsall(4,7) && emptycells.contains(1))){
      index = 1;
    }
    else if((Player.playerX.containsall(5,8) && emptycells.contains(2))){
      index = 2;
    }
    else if((Player.playerX.containsall(4,8) && emptycells.contains(0))){
      index = 0;
    }
    else if((Player.playerX.containsall(4,6) && emptycells.contains(2))){
      index = 2;
    }
    else{
    Random random = Random();
    int randomindex = random.nextInt(emptycells.length);
    index = emptycells[randomindex];
    }
    PlayGame(index, activeplayer);
  }
}