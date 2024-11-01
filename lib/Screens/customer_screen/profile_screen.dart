import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          Icon(Icons.more_vert), // For additional actions or settings
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileInfo(),
          SizedBox(height: 30),
          _buildOrderSummary(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  // Profile Info Section
  Widget _buildProfileInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://example.com/profile-pic.jpg'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'suvodh dhungyell',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Account type: customer'),
          ],
        ),
        Spacer(),
        Icon(Icons.settings), // Settings icon on the right
      ],
    );
  }

  // Order Summary Section
  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Orders',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All Orders'),
            ),
          ],
        ),
        SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildOrderStatus('To Pay', Icons.account_balance_wallet),
            _buildOrderStatus('To Ship', Icons.local_shipping),
            _buildOrderStatus('To Receive', Icons.inbox),
            _buildOrderStatus('To Review', Icons.rate_review),
            _buildOrderStatus('Returns', Icons.undo),
            _buildOrderStatus('Chat with Us', Icons.chat),
            _buildOrderStatus('Payment Options', Icons.payment),
            _buildOrderStatus('My Reviews', Icons.star),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderStatus(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.orange),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}