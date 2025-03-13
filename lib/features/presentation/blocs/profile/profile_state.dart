part of 'profile_cubit.dart';

enum ProfileStatus {isLoading, loaded, error}

class ProfileState extends Equatable {

  final ProfileStatus profileStatus; 
  final String firstName;
  final String lastName;
  final String birthdate;
  final String email;
  final String password;
  final List<String> addresses;

  const ProfileState({
    this.profileStatus = ProfileStatus.loaded,
    this.firstName = '', 
    this.lastName = '', 
    this.birthdate = '', 
    this.email = '', 
    this.password = '', 
    this.addresses = const []
  });

ProfileState copyWith({
  ProfileStatus? profileStatus,  
  String? firstName,
  String? lastName,
  String? birthdate,
  String? email,
  String? password,
  List<String>? addresses,
}) => ProfileState(
  profileStatus: profileStatus ?? this.profileStatus,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  birthdate: birthdate ?? this.birthdate,
  email: email ?? this.email,
  password: password ?? this.password,
  addresses: addresses ?? List.from(this.addresses),
);

  @override
  List<Object> get props => [profileStatus, firstName, lastName, birthdate, email, password, addresses];
}

final class ProfileInitial extends ProfileState {}
