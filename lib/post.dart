class Post {
  String name;
  String imagePath;
  String time;
  String desc;
  int likes;
  int comments;

  Post({
    required this.name,
    required this.imagePath,
    required this.time,
    required this.desc,
    this.likes = 0,
    this.comments = 0,
  });

  String setTime() => "Il y a $time";

  String setLikes() {
    return "$likes J'aime";
  }

  String setComments() {
    if (comments > 1) {
      return "$comments Commentaires";
    } else {
      return "$comments Commentaire";
    }
  }
}
