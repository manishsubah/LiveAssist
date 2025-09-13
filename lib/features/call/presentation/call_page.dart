import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'call.dart' as call_screen;

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final TextEditingController _callIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _callIdController.dispose();
    super.dispose();
  }

  void _joinCall() {
    final callId = _callIdController.text.trim();
    if (callId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a call ID'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate brief loading then navigate to call
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => call_screen.CallPage(callID: callId),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 
                         MediaQuery.of(context).padding.top - 
                         MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    // Top spacing
                    SizedBox(height: 60.h),
                    
                    // App Logo
                    _buildAppLogo(),
                    
                    SizedBox(height: 40.h),
                    
                    // App Title
                    _buildAppTitle(),
                    
                    SizedBox(height: 8.h),
                    
                    // Subtitle
                    _buildSubtitle(),
                    
                    SizedBox(height: 60.h),
                    
                    // Call ID Input Field
                    _buildCallIdInput(),
                    
                    SizedBox(height: 24.h),
                    
                    // Join Call Button
                    _buildJoinCallButton(),
                    
                    SizedBox(height: 40.h),
                    
                    // Additional features - only show when keyboard is not visible
                    if (MediaQuery.of(context).viewInsets.bottom == 0)
                      _buildAdditionalFeatures(),
                    
                    // Bottom spacing
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Left speech bubble
          Positioned(
            left: 8.w,
            top: 20.h,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xFF4CAF50),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(),
                    SizedBox(width: 2.w),
                    _buildDot(),
                    SizedBox(width: 2.w),
                    _buildDot(),
                  ],
                ),
              ),
            ),
          ),
          // Right speech bubble
          Positioned(
            right: 8.w,
            top: 12.h,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xFF4CAF50),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(),
                    SizedBox(width: 1.5.w),
                    _buildDot(),
                    SizedBox(width: 1.5.w),
                    _buildDot(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 3.w,
      height: 3.w,
      decoration: const BoxDecoration(
        color: Color(0xFF4CAF50),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildAppTitle() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "LET'S ",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          TextSpan(
            text: "TALK",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4CAF50),
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "CONNECT TO THE WORLD",
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildCallIdInput() {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _callIdController,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Enter call id to join",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey.withValues(alpha: 0.6),
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
        ),
        onSubmitted: (_) => _joinCall(),
      ),
    );
  }

  Widget _buildJoinCallButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _joinCall,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
        ),
        child: _isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                "JOIN A CALL",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
      ),
    );
  }

  Widget _buildAdditionalFeatures() {
    return Column(
      children: [
        // Recent Calls Section - more compact
        _buildRecentCalls(),
        
        SizedBox(height: 16.h),
        
        // Quick Actions
        _buildQuickActions(),
      ],
    );
  }

  Widget _buildRecentCalls() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Recent Calls",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          _buildRecentCallItem("Call ID: 12345", "2h ago"),
          SizedBox(height: 4.h),
          _buildRecentCallItem("Call ID: 67890", "Yesterday"),
        ],
      ),
    );
  }

  Widget _buildRecentCallItem(String callId, String time) {
    final actualCallId = callId.split(": ")[1];
    return InkWell(
      onTap: () {
        // Navigate directly to the call with the selected call ID
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => call_screen.CallPage(callID: actualCallId),
          ),
        );
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Container(
              width: 6.w,
              height: 6.w,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                callId,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white70,
                ),
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: _buildQuickActionButton(
            icon: Icons.video_call,
            label: "Start Call",
            onTap: () {
              // Generate a random call ID for starting a new call
              final randomCallId = DateTime.now().millisecondsSinceEpoch.toString();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => call_screen.CallPage(callID: randomCallId),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildQuickActionButton(
            icon: Icons.history,
            label: "Call History",
            onTap: () {
              // TODO: Navigate to call history
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Call history feature coming soon!'),
                  backgroundColor: Color(0xFF4CAF50),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF4CAF50),
              size: 20.sp,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
