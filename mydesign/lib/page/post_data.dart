import 'package:provider/provider.dart';

import 'custom_row.dart';

import 'package:flutter/material.dart';

import "../controller/provider_get.dart";

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderGet>().getPosts();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset('images/pink2.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'images/analytics.png',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Instant Updates',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/pie-chart.png',
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Consumer<ProviderGet>(
                      builder: (context, provider, child) {
                        final posts = provider.posts;
                        if (provider.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        if (provider.posts.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.refresh_rounded,
                                  color: Colors.white,
                                  size: 48,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Loading posts...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          itemCount: posts.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final item = posts[index];
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffFDF2F6),
                                borderRadius: BorderRadius.circular(16),
                                border: item.completed!
                                    ? Border.all(
                                        color: Color(0xff76d743),
                                        width: 2,
                                      )
                                    : Border.all(
                                        color: Color(0xffd74343),
                                        width: 2,
                                      ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CustomRow(text: item.id.toString()),
                                  SizedBox(height: 8),
                                  CustomRow(text: item.userId.toString()),
                                  SizedBox(height: 8),
                                  CustomRow(text: item.title),
                                  SizedBox(height: 8),
                                  CustomRow(text: item.completed.toString()),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
