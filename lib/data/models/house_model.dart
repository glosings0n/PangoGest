class HouseModel {
  final int? id;
  final String surface;
  final String description;
  final String price;
  final String photo;
  final int addressID;
  final int userID;
  final bool isOccupied;

  HouseModel({
    this.id,
    required this.addressID,
    required this.userID,
    this.surface = "",
    required this.description,
    required this.price,
    this.photo =
        "https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F03.jpg?alt=media&token=e52bee36-2bcc-4e16-b0a8-c23c07703344",
    this.isOccupied = false,
  });

  factory HouseModel.fromJson(json) {
    return HouseModel(
      id: json["id"] as int,
      photo: json["photo_url"] as String,
      price: json["prix"] as String,
      surface: json["surface"] as String,
      description: json["description"] as String,
      addressID: json["adresse"] as int,
      userID: json["utilisateur"] as int,
    );
  }
}

// List<HouseModel> houses = [
//   HouseModel(
//     id: "01",

//     description:
//         "Maison du premier niveau avec 1 salon, 1 chambre, toilette & douche interne",
//     price: 100,
//     photo:
//         'https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F01.jpg?alt=media&token=bbefbcf8-c266-414e-bef7-e1d3b1408791',
//   ),
//   HouseModel(
//     id: "02",
//     adresse: AddressModel(
//       id: 2,
//       commune: "Ibanda",
//       quartier: "Nyalukemba",
//       avenue: "E.P. Lumumba",
//     ),
//     description:
//         "Maison du deuxième niveau avec 1 salon, 2 chambres, toilette & douche interne",
//     price: 150,
//     photo:
//         "https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F02.jpg?alt=media&token=f507e58e-8243-474b-a3a5-abbf88359f8c",
//   ),
//   HouseModel(
//     id: "03",
//     adresse: AddressModel(
//       id: 3,
//       commune: "Bagira",
//       quartier: "Nyakavogo",
//       avenue: "B4",
//       num: "N° B023",
//     ),
//     description:
//         "Maison simple avec 1 salon, 3 chambres, toilette & douche externe, un cours pour enfant et verdure",
//     price: 130,
//     isOccupied: true,
//     photo:
//         "https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F03.jpg?alt=media&token=e52bee36-2bcc-4e16-b0a8-c23c07703344",
//   ),
//   HouseModel(
//     id: "04",
//     adresse: AddressModel(
//       id: 4,
//       commune: "Kadutu",
//       quartier: "Essence",
//       avenue: "Major Vandu",
//       num: "N° 0165",
//     ),
//     description:
//         "Maison simple, 1 salon, 2 chambres, toilette & douche interne",
//     price: 150,
//     isOccupied: true,
//     photo:
//         "https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F04.jpg?alt=media&token=1a1938f3-2312-44b1-8711-967fdc6246c4",
//   ),
//   HouseModel(
//     id: "05",
//     adresse: AddressModel(
//       id: 5,
//       commune: "Bagira",
//       quartier: "Chikera",
//       avenue: "C5",
//     ),
//     description:
//         "Maison du rez-de-chaussée avec 1 salon, 3 chambres, toilette & douche externe, clôturée",
//     price: 125,
//     photo:
//         "https://firebasestorage.googleapis.com/v0/b/pangogest.appspot.com/o/demo-houses%2F05.jpg?alt=media&token=92aa0953-b12d-42f4-b488-c5659cbe2432",
//   ),
// ];
