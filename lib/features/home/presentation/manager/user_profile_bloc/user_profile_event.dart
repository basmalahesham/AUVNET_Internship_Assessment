part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfileEvent {
  final String userId;
  const LoadUserProfile(this.userId);
  @override
  List<Object> get props => [userId];
}