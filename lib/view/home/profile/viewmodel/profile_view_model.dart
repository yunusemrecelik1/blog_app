import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/service/user_service/IUserService.dart';
import 'package:blog_app/service/user_service/user_service.dart';
import 'package:blog_app/view/home/profile/service/IProfileService.dart';
import 'package:blog_app/view/home/profile/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../view/subview/view/profile_modal_bottom_view.dart';

class ProfileViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  late File image;
  bool isImageSelected = false;
  bool isNetworkImage = false;
  late IProfileService profileService;
  late IUserService userService;
  String imageUrl = "";
  double longitude = 0;
  double latitude = 0;
  Completer<GoogleMapController> controller = Completer();
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(0,0),
    zoom: 14.4746,
  );

  Future<CameraPosition> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator.getCurrentPosition();
    longitude = position.longitude;
    latitude = position.latitude;
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(longitude,latitude),
      zoom: 14.4746,
    );
    cameraPosition = kGooglePlex;
    notifyListeners();
    return kGooglePlex;
  }

  @override
  Future<void> init() async {
    _determinePosition();
    profileService = ProfileService(NetworkManager.instance!);
    userService = UserService(NetworkManager.instance!);
    getUserImage();
  }

  Future<void> fetchImage() async{
    if(isImageSelected){
      profileService.fetchImage(image);
    }
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", "");
    NavigationService.instance.navigateToPageClear(
      path: NavigationConstants.login,
    );
  }

  Future<void> getUserImage() async{
    final response = await userService.getUser();
    imageUrl = response.image ?? "";
    if(imageUrl != ""){
      isNetworkImage = true;
      notifyListeners();
    }
    else {
      isNetworkImage = false;
    }
  }

  Future<void> getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      image = file;
      isImageSelected = true;
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void deleteImage() {
    if (isImageSelected) {
      image.delete();
      isImageSelected = false;
      notifyListeners();
    }
  }

  Future<void> getImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      image = file;
      isImageSelected = true;
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void showModalBottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return const ProfileModalBottomView();
        }).then((value) {
      if(value["status"] == "success"){
        image = value["file"];
        isImageSelected = true;
        notifyListeners();
      }
    });
  }
}
