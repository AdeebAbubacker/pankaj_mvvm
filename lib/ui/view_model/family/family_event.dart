part of 'family_bloc.dart';

@immutable
class FamilyEvent {}

class ForSiblings extends FamilyEvent{
 final  bool siblings;
 
  ForSiblings({this.siblings = false,});
}

class FornoSiblings extends FamilyEvent{
  final bool nosiblings;
  FornoSiblings({this.nosiblings = false,});
}

