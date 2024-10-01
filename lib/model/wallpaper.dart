class Wallpaper{
  String image;
  String photo;
  String avg;
  String late;

  Wallpaper({
    required this.image,
    required this.photo,
    required this.avg,
    required this.late
});

 factory Wallpaper.forMap(Map<String,dynamic>map){
   return Wallpaper(
       image: map['src']['portrait'],
       photo: map['photographer'],
     avg: map['avg_color'],
     late: map['alt'],
   );
 }
}