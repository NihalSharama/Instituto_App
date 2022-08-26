class User {
  final String id;
  final int institute;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final int mobile;
  final String is_verified;
  final String is_created;
  final String is_subscribed;
  final List<String> batches;
  final List notification;
  final List requests;
  final List chats;
  final DateTime lastFeePayment;

  User(
      this.id,
      this.firstName,
      this.lastName,
      this.role,
      this.email,
      this.mobile,
      this.is_verified,
      this.is_created,
      this.institute,
      this.batches,
      this.notification,
      this.requests,
      this.chats,
      this.is_subscribed,
      this.lastFeePayment);
}
