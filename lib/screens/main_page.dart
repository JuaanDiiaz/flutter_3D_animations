
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.controller,
  });

  final Flutter3DController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                color: Colors.white,
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
              const TitleWidget(tittle: "Sucursales cerca de ti",),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text("Sucursal 1"),
                          const SizedBox(height: 10),
                          const Text("Dirección: Calle 123"),
                          const SizedBox(height: 10),
                          const Text("Teléfono: 1234567890"),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/map');
                            },
                            child: const Text("Ver en mapa"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
