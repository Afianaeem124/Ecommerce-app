library globals;

List<Map<String, dynamic>> reviews = [];
List<Map<String, dynamic>> cartItems = [];
List<Map<String, dynamic>> favourites = [];

String fullName = '';
String address = '';
String city = '';
String province = '';
String zipCode = '';
String country = '';
double total = 0;
String name = '';
String email = '';

String selectedFilter = 'None';
String selectedSize = 'None';

class PaymentCard {
  String cardNumber;
  String nameOnCard;
  String expireDate;
  String cvv;
  bool isDefault;

  PaymentCard({
    required this.cardNumber,
    required this.nameOnCard,
    required this.expireDate,
    required this.cvv,
    required this.isDefault,
  });
}
