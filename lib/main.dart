import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  List<Post> posts = [
    Post(
        name: "Nana Abdoul Razack",
        imagePath: "assets/images/background.jpg",
        time: "5 minutes",
        desc:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi, numquam temporibus suscipit quo sequi ipsam quia et saepe odio impedit ullam architecto. Error voluptatem tempore beatae reprehenderit quisquam inventore iusto."),
    Post(
        name: "Dene Charifatou",
        imagePath: "assets/images/profile.jpg",
        time: "2 jours",
        desc:
            "L'amour est tres beau mais le probleme est que cela ne dure pas!",
        likes: 2199,
        comments: 336),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Facebook Profile"),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(alignment: Alignment.topCenter, children: [
              Image.asset(
                "assets/images/background.jpg",
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(top: 125),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: myProfilePic(72),
                ),
              ),
            ]),
            Row(children: [
              Spacer(),
              Text(
                "Abdoul Razack Nana",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Spacer(),
            ]),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                )),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("A propos de moi"),
            aboutRow(icon: Icons.house, text: "Ouagadougou, Burkina Faso"),
            aboutRow(icon: Icons.work, text: "Developpeur FullStack"),
            aboutRow(icon: Icons.favorite, text: "Celibataire tres confirmer"),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Amis"),
            allFreinds(width / 4),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Mes Posts"),
            allPosts(),
          ]),
        ));
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage("assets/images/profile.jpg"),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: (icon == null)
          ? Center(
              child: Text(
                text ?? "",
                style: TextStyle(color: Colors.white),
              ),
            )
          : Icon(
              icon,
              color: Colors.white,
            ),
      height: 50,
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )));
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(children: [
      Icon(
        icon,
        color: Colors.green,
      ),
      Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
          )),
    ]);
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(5),
        width: width,
        height: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [BoxShadow(color: Colors.grey)],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      Text(name),
      Padding(padding: EdgeInsets.only(bottom: 5))
    ]);
  }

  Row allFreinds(double width) {
    Map<String, String> friends = {
      "Youl": "assets/images/profile.jpg",
      "Nass": "assets/images/profile.jpg",
      "Claude": "assets/images/profile.jpg",
    };
    List<Widget> friendsList = [];
    friends.forEach((name, imagePath) {
      friendsList.add(friendsImage(name, imagePath, width));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: friendsList,
    );
  }

  Column allPosts() {
    List<Widget> postsList = [];
    posts.forEach((element) {
      postsList.add(post(post: element));
    });
    return Column(
      children: postsList,
    );
  }

  Container post({required Post post}) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(children: [
            myProfilePic(20),
            Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            Text(
              post.name,
            ),
            Spacer(),
            timeText(post.setTime())
          ]),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 8),
            child: Image.asset(post.imagePath, fit: BoxFit.cover),
          ),
          Text(
            post.desc,
            style: TextStyle(
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.start,
          ),
          Divider(),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.favorite, color: Colors.red),
                Text(post.setLikes()),
                Spacer(),
                Icon(Icons.comment, color: Colors.green),
                Text(post.setComments()),
              ])
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text(
      "Il y'a $time",
      style: TextStyle(color: Colors.blue),
    );
  }
}
