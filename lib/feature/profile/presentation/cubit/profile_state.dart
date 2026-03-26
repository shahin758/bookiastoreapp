class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ShowProfileLoadingState extends ProfileState {}

class ShowProfileSuccessState extends ProfileState {}

class ShowProfileErrorState extends ProfileState {
  final String error;

  ShowProfileErrorState(this.error);
}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileErrorState extends ProfileState {
  final String error;

  UpdateProfileErrorState(this.error);
}

class UpdatePasswordLoadingState extends ProfileState {}

class UpdatePasswordSuccessState extends ProfileState {}

class UpdatePasswordErrorState extends ProfileState {
  final String error;

  UpdatePasswordErrorState(this.error);
}

