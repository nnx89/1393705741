class Post{
  //动态列表
  final String image, time, text, place;

  Post(
  {required this.image, required this.time, required this.text, required this.place}
      );
}

// 每个人的动态列表
List<Post> smith = [
  Post(
      image: "assets/images/post3.jpeg",
      time: "3 Hours AGO",
      text: "I love ya Jada!",
      place: "Dolby Theatre, Hollywood"
  ),
  Post(
      image: "assets/images/post.png",
      time: "4 Hours AGO",
      text: "Love will make u do something crazy!",
      place: "Dolby Theatre, Hollywood"
  ),
];

List<Post> eileen = [
  Post(
      image: "assets/images/eileen1.png",
      time: "1 Hours AGO",
      text: "ready for pipe finals tomorrow!",
      place: "Olympic Winter Games, Beijing"
  ),
  Post(
      image: "assets/images/eileen2.png",
      time: "12 Hours AGO",
      text: "ootd",
      place: "Beijing, China"
  ),
];