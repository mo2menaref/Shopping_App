import 'package:flutter/material.dart';


final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

late PageController pageViewController;
late TabController tabController;
int currentPageIndex = 0;