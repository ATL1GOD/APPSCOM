/*import 'package:flutter/material.dart';

import 'package:appscom/src/res/components/course.dart';
import 'components/course_card.dart';
import 'components/secondary_course_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Courses",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map(
                        (course) => Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CourseCard(
                            title: course.title,
                            iconSrc: course.iconSrc,
                            color: course.color,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ...recentCourses.map((course) => Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SecondaryCourseCard(
                      title: course.title,
                      iconsSrc: course.iconSrc,
                      colorl: course.color,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
*/


import 'package:appscom/src/screens/news/carousel_slide.dart';
import 'package:flutter/material.dart';

/*import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscom/src/res/colors.dart';
import 'package:go_router/go_router.dart';
*/
import 'package:appscom/src/res/components/course.dart';
import 'components/course_card.dart';
import 'components/secondary_course_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Ultimas Noticias",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
              ),
              const NewsCarouselSlider(),
              /*SingleChildScrollView( //esta parte realiza el scroll de los cursos
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map((course) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              //child: CourseCard(course: course),
                            ))
                        .toList(),
                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Apartados Interesantes",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: const Color.fromARGB(255, 2, 82, 148),
                    fontWeight: FontWeight.w600), 
                ),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SecondaryCourseCard(course: course),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
