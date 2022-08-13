import 'dart:io';

import 'package:guess_number2/game.dart';

void main() {
  bool s = true;
  List<int> my = [];
  while (s) {
    stdout.write('Enter a maximum number to Random Number :');
    var iN = stdin.readLineSync();
    var gu = int.tryParse(iN!);
    var game;
    var result = 0;
    int? max;
    int count = 0;

    if (gu == null) {
      game = Game();
      max = 100;
    } else {
      max = gu;
      game = Game(maxRandom: gu);
    }

    print('╔══════════════════════════════════════════════════ ');
    print('║               GUESS THE NUMBER');
    print('╟──────────────────────────────────────────────────');
    do {
      stdout.write('║ Please guess the number between 1 and  $max : ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!); // ! = non-null

      if (guess == null) {
        print('║ Please enter "Number" only');
        print('╟──────────────────────────────────────────────────');
        continue;
      }

      result = game.doGuess(guess);
      count++;

      if (result == 1) {
        print('║ $guess is too High ▲');
      } else if (result == 2) {
        print('║ $guess is too Low ▼');
      } else if (result == 3) {
        print('║  $guess is Correct ♥, TOTAL GUESSES : $count');
      }

      print('╟──────────────────────────────────────────────────');
    } while (result != 3);
    my.add(count);

    print('║                      THE END');
    print("╚══════════════════════════════════════════════════");
    while (true) {
      stdout.write('Play again (Y/N) :');
      var an = stdin.readLineSync();
      if (an == 'Y' || an == 'y') {
        s = true;
        break;
      } else if (an == 'N' || an == 'n') {
        var len = my.length;
        print('your palyed ${my.length} game');
        for(int i=0;i<len;i++) {
          print('game #${i+1} : ${my[i]}');
        }
        return;
      }
    }
  }
}