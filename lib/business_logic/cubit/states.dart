abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class SignOut extends AppStates {}

//Get User
class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;

  GetUserErrorState(this.error);
}


// profile image
class UpdateProfileLoadingsState extends AppStates {}

class UpdateProfileSuccessState extends AppStates {}

class UpdateProfileErrorState extends AppStates {
  final String error;

  UpdateProfileErrorState(this.error);
}

class ProfileImageSuccessState extends AppStates {}

class ProfileImageErrorState extends AppStates {}

class UploadProfileImageLoadingsState extends AppStates {}

class UploadProfileImageErrorState extends AppStates {}


