import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery_app/picture_details.dart';


 void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoGalleryApp()
  ));
}

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  List images = [
 " https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnYfk1ZlW4QTFveXZKi7FzTt-WwgCi07bchBhd6hIk7oyllqyDhqvc77SQq8-sghOl5O8&usqp=CAU4",
  "https://images.unsplash.com/photo-1517960413843-0aee8e2b3285?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFwcHklMjBsaWZlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjT3O03UVCF_oIUabwVVVUUQA9YuJW0OxkBrrI2qqAy7uD0WoGS4U6_iJ0A_YQRNbgvG4&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Photo Gallery App",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height : 18.0),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.amber),
                    hintText: "Search for Image",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0)
                     )
                  ),
                ),
             SizedBox(height: 24.0,),
             Expanded(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
               child: StaggeredGridView.countBuilder(
                 crossAxisCount: 2,
                 crossAxisSpacing: 12,
                 mainAxisSpacing: 12,
                 itemCount: images.length,
                 itemBuilder: (context,index){
             return Container(
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 borderRadius: BorderRadius.circular(8.0)
               ),

               child: GestureDetector(
                   onTap: (){
                     Navigator.push(context,
                       MaterialPageRoute(builder:(context) =>
                           PictureDetailScreen (images[index])));
                   },
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0),
                   child: Image.network(images[index],fit:BoxFit.fill ),

                 ),
                 ),
                );

                 },
                 staggeredTileBuilder: (index){
                   return new StaggeredTile.count(1,index.isEven ? 1.2 :2);
                 }
               ),
             )

             )]

          ),
        ),
      ),
    );
  }
}



