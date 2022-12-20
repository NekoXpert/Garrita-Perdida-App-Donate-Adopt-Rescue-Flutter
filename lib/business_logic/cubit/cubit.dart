import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'states.dart';

import '../../data/models/user_model.dart';
import '../../helpers/cache_helper.dart';
import '../../presentation/modules/login/login_screen.dart';
import '../../presentation/modules/adopta.dart';
import '../../presentation/modules/more_screen.dart';
import '../../presentation/modules/report_screen.dart';
import '../../presentation/modules/profile_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<Widget> pages = [
    const MenuScreen(),
    const ReportScreen(),
    ProfileScreen(),
    const MoreScreen(),
  ];

  void changeIndex(int index) {
    if (index == 2) {
      getUser();
    }

   

    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  //* get user and signout
  UserModel? userModel;
  void getUser() {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

  void signOut(context) {
    CacheHelper.removeData('uId').then((value) {
      if (value) {
        FirebaseAuth.instance.signOut().then((value) {
          navigateAndFinish(context, LoginScreen());
        });
      }
    });
  }

//* change user profile
  void updateProfile({
    required String? name,
    required String? address,
    required String? phone,
    String? image,
    String? bio,
  }) {
    emit(UpdateProfileLoadingsState());

    UserModel model = UserModel(
      uId: userModel!.uId,
      name: name,
      email: userModel!.email,
      address: address,
      phone: phone,
      image: image ?? userModel!.image,
      bio: bio ?? userModel!.bio,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      getUser();
    }).catchError((error) {
      emit(UpdateProfileErrorState(error.toString()));
    });
  }

  File? image;
  var picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(ProfileImageSuccessState());
    } else {
      emit(ProfileImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String address,
  }) {
    emit(UploadProfileImageLoadingsState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateProfile(
          name: name,
          address: address,
          phone: phone,
          image: value,
        );
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  

   /* FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('orders')
        .add(model.toJson())
        .then((value) {
      getOrderProducts();
      clearCart();
    }).catchError((error) {
      emit(AddOrdersErrorState(error.toString()));
    });
  }
*/
  /*List<OrderModel> orders = [];
  void getOrderProducts() {
    orders = [];
    emit(GetOrdersLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('orders')
        .get()
        .then((value) {
      for (var element in value.docs) {
        orders.add(OrderModel.fromJson(element.data()));
      }
      emit(GetOrdersSuccessState());
    }).catchError((error) {
      emit(GetOrdersErrorState());
    });
  }*/

}
