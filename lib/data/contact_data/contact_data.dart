class ContactData{
  List data = [];

  List<String> userName = List.empty(growable: true);
  List getUsernameContactData() {

    for (var getUsername in data) {
      userName.add(getUsername['username']);
    }
    return userName;
  }

  List<String> phone = List.empty(growable: true);
  List getPhoneContactData() {
    for (var getPhone in data) {
      phone.add(getPhone['phone']);
    }
    return phone;
  }

  void addDataUserName(String name){
    data.add(name);
  }

  void addDataPhone(String phone){
    data.add(phone);
  }
}