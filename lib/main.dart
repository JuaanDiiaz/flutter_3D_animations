import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bizzarro 3D Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Flutter3DController controller = Flutter3DController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.onModelLoaded.addListener(() {
      print('model is loaded : ${controller.onModelLoaded.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 10),
                const TitleWidget(tittle: "Visualiza tu producto de la mejor manera"),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: //The 3D viewer widget for glb and gltf format
                   Flutter3DViewer(
                      //If you pass 'true' the flutter_3d_controller will add gesture interceptor layer
                      //to prevent gesture recognizers from malfunctioning on iOS and some Android devices.
                      //the default value is true
                      activeGestureInterceptor: true,
                      //If you don't pass progressBarColor, the color of defaultLoadingProgressBar will be grey.
                      //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                      progressBarColor: Colors.orange,
                      //You can disable viewer touch response by setting 'enableTouch' to 'false'
                      enableTouch: true,
                      //This callBack will return the loading progress value between 0 and 1.0
                      onProgress: (double progressValue) {
                        print('model loading progress : $progressValue');
                      },
                      //This callBack will call after model loaded successfully and will return model address
                      onLoad: (String modelAddress) {
                        print('model loaded : $modelAddress');
                      },
                      //this callBack will call when model failed to load and will return failure error
                      onError: (String error) {
                        print('model failed to load : $error');
                      },
                      //You can have full control of 3d model animations, textures and camera
                      controller: controller,
                      src: 'assets/ring.glb', //3D model with different animations
                      //src: 'assets/sheen_chair.glb', //3D model with different textures
                      //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                  ),
                ),
                const SizedBox(height: 20),
                const TitleWidget(tittle: "Promociones"),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 182, 232, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
                const TitleWidget(tittle: "Nuestros productos",),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 182, 232, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key, required this.tittle,
  });

  final tittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        tittle,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }
}
