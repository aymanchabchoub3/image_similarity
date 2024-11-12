// dart =statically typed language
//  lzm el var ely ta3tihelou ta93ad de mme type (ki ta3tih string ta93ad dima sandou9 hka ll string)
// void main(){
// var myColor = 123;
// print(myColor);
// myColor = 12; !!! error
// var ex;
// ex = 'hello';
// ex = 123; !!!not error
// }
// data type :
//   - string
//   -integer
//   -double
//   - bool
//   -dynamic (string ou int ou bool)
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text("image similarity"),
        backgroundColor: Colors.indigo[800],
      ),
      body: const ImagePage(),
    ),
  ));
}

// 3melna stfll hyt mahich 4ebta
class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  // const ImagePage({super.key});
  int leftImageNum = 1;
  int rightImageNum = 1;
  void changeImage() {
    leftImageNum = Random().nextInt(8) + 1;
    rightImageNum = Random().nextInt(8) + 1;
  }

  //  htineha hna hyt mouch kol hot reload mech ttbdl
  @override
  Widget build(BuildContext context) {
    //ay var thetou hna ki ta3ml hot relod yetbedel
    // ki thetou 9bal build lezm ta3ml refresh

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            leftImageNum == rightImageNum ? "you win !!!" : "try again",
            style: const TextStyle(
              fontSize: 42,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: Expanded(
                    child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            //tbalag ely enty bedelt bech el tel ya3ml hot reload
                            changeImage();
                          });
                        } //voidcallback
                        ,
                        child: Image.asset(
                          "images/image$leftImageNum.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: Expanded(
                    child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            changeImage();
                          });
                        },
                        child: Image.asset(
                          "images/image$rightImageNum.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
