import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';




class uiHelper {
     static customTextfield( TextEditingController controller, 
     String text, IconData icon, bool tohide){
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
         child: TextField(
            controller: controller,
            obscureText: tohide,
              style: TextStyle(color: Colors.pinkAccent),
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(color: Colors.pinkAccent), // 👈 Optional: hint text color
        suffixIcon: Icon(icon, color: Colors.pinkAccent),
               border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(25)
          )
                          ),
                     ),
       );

     }     
     static customButton(VoidCallback voidCallBack, String text){
           return SizedBox(height: 30,width: 200,child: ElevatedButton(onPressed: (){
            voidCallBack();
           },style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
           ), child: Text(text, style: TextStyle(color: Colors.pinkAccent),)),
           );
        


     }
     static customALertBox(BuildContext context, String text){
      return showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("ok") )
          ],
        );
      });
     }
     static customAppBar(){
      return AppBar(
        title: Text("RAKSHA", 
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 212, 8, 76),
      ); }

      static cutomBody(){
             return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: 
                  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Text("My Women App",style:TextStyle(color: Colors.white,fontSize: 50) ,)
                  ],
                



                 )

             );

      }   
      
      
      
     static Widget carousalSlider({
  required List<String> imagePaths,
  double height = 300.0,
  bool autoPlay = true,
}) {
  return CarouselSlider(
    items: imagePaths.map((imagePath) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Adjust this to BoxFit.contain or fill as needed
                width: 500,
                height: height,
              ),
            ),
          );
        },
      );
    }).toList(),
    options: CarouselOptions(
      height: height,
      autoPlay: autoPlay,
      enlargeCenterPage: true,
      autoPlayInterval: const Duration(seconds: 3),
      viewportFraction: 0.9,
    ),
  );
}
}