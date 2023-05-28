class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  Data? data;

  UserModel.fromJson(Map json) {
    this.page = json['page'];
    this.perPage = json['per_page'];
    this.total = json['total'];
    this.totalPages = json['total_pages'];
    this.data = Data.fromJson(json['data']);
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatarUrl;

  Data.fromJson(Map json) {
    this.id = json['id'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.email = json['email'];
    this.avatarUrl = json['avatar'];
  }
}
