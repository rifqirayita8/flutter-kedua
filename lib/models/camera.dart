import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vi_whatsapp/widgets/camera_action.dart';
import 'package:vi_whatsapp/widgets/camera_view.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController _cameraController;

  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController= CameraController(cameras[0], ResolutionPreset.high);
    cameraValue= _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue, 
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return CameraPreview(_cameraController);
              } else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            ),
            Positioned(
                bottom: 0.0,
                child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                         InkWell(
                          onTap: () {
                            takePhoto(context);
                          },
                          child: Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                         IconButton(
                          icon: const Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Hold for Video, Tap fot photo",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
    void takePhoto(BuildContext context) async{
      final path = join((await getTemporaryDirectory()).path,"${DateTime.now()}");
      XFile picture= await _cameraController.takePicture();
      picture.saveTo(path);

      Navigator.push(
        context, MaterialPageRoute(builder: (builder) => CameraAction()));
    }
} 