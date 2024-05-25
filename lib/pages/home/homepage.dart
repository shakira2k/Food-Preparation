import 'package:dinnerdive/functions/firebase_auth.dart';
import 'package:dinnerdive/pages/description/description.dart';
import 'package:flutter/material.dart';
import '../../items/datamap.dart';
import '../../widget/curosel_slider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    // firebaseFunctions.getUserDetails();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(12)),
              child: CustomImageCarousel(imageUrls: imageList)),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                " Top Meals",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.97,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final data = recipes[index][0];
              final img = imageList[index];
              return Card(
                color: Colors.deepOrange.shade300,
                shadowColor: Colors.deepOrange.shade200,
                margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                elevation: 2,
                surfaceTintColor: Colors.deepOrange.shade300,
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Description(
                                    datas: recipes[index], imageUrls: img),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    img,
                                  ))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
