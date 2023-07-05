import '../../main.dart';
import '../../main/models/models.dart';
import 'package:nb_utils/nb_utils.dart';

List<String> getUserCancelReasonList() {
  List<String> list = [];
  list.add(language.placeOrderByMistake);
  list.add(language.deliveryTimeIsTooLong);
  list.add(language.duplicateOrder);
  list.add(language.changeOfMind);
  list.add(language.changeOrder);
  list.add(language.incorrectIncompleteAddress);
  list.add(language.other);
  return list;
}

List<String> getDeliveryCancelReasonList() {
  List<String> list = [];
  list.add(language.incorrectIncompleteAddress);
  list.add(language.wrongContactInformation);
  list.add(language.damageCourier);
  list.add(language.paymentIssue);
  list.add(language.personNotAvailableOnLocation);
  list.add(language.invalidCourierPackage);
  list.add(language.courierPackageIsNotAsPerOrder);
  list.add(language.other);
  return list;
}

List<String> getReturnReasonList() {
  List<String> list = [];
  list.add(language.invalidOrder);
  list.add(language.damageCourier);
  list.add(language.sentWrongCourier);
  list.add(language.notAsOrder);
  list.add(language.other);
  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        subTitle: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'assets/flag/ic_us.png'),
    LanguageDataModel(
        id: 3,
        name: 'French',
        subTitle: 'Français',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'assets/flag/ic_france.png'),
  ];
}

List<WalkThroughItemModel> getWalkThroughItems() {
  List<WalkThroughItemModel> list = [];
  list.add(WalkThroughItemModel(
      image: 'assets/walk_through1.png',
      title: language.walkThrough1Title,
      subTitle: language.walkThrough1Subtitle));
  list.add(WalkThroughItemModel(
      image: 'assets/walk_through2.png',
      title: language.walkThrough2Title,
      subTitle: language.walkThrough2Subtitle));
  list.add(WalkThroughItemModel(
      image: 'assets/walk_through3.png',
      title: language.walkThrough3Title,
      subTitle: language.walkThrough3Subtitle));
  return list;
}
