import 'package:ex_4/model/joke.dart';
import 'package:flutter/material.dart';
import 'package:ex_4/data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(FavoriteJoke());

class FavoriteJoke extends StatefulWidget {
  const FavoriteJoke({super.key});
  @override
  State<FavoriteJoke> createState() => _FavoriteJoke();
}

class _FavoriteJoke extends State<FavoriteJoke> {
  int? favoriteIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView.builder(
          itemCount: jokesList.length,
          itemBuilder: (context, index) {
            return FavoriteCard(
              jokes: jokesList[index],
              isFavorite: favoriteIndex == index,
              onFavoriteClick: () {
                setState(() {
                  favoriteIndex = index;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
class FavoriteCard extends StatelessWidget {
  final Joke jokes;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.jokes,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokes.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(jokes.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


// class FavoriteCard extends StatefulWidget {
//   final Joke jokes;
//   final bool isFavorite;
//   final VoidCallback onFavoriteClick;
//   const FavoriteCard({
//     super.key,
//     required this.jokes,
//     required this.isFavorite,
//     required this.onFavoriteClick,
//   });

//   @override
//   State<FavoriteCard> createState() => _FavoriteCardState();
// }

// class _FavoriteCardState extends State<FavoriteCard> {
//   bool _isFavorite = false;

//   void onFavoriteClick() {
//     setState(() {
//       _isFavorite = !_isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
//       ),
//       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             flex: 7,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   // 'title',
//                   widget.jokes.title,
//                   style: TextStyle(
//                     color: appColor,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 // Text("description"),
//                 Text(widget.jokes.description),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: widget.onFavoriteClick,
//             icon: Icon(
//               widget.isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: widget.isFavorite ? Colors.red : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
