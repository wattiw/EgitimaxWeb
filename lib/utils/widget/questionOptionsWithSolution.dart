import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/widget/collapseChild.dart';
import 'package:egitimax/utils/widget/htmlRenderer.dart';
import 'package:flutter/material.dart';

class QuestionOptionsWithSolution extends StatelessWidget {
  final TblQueQuestionMain? question;
  final List<TblQueQuestionOption>? options;
  final List<TblQueQuestionAchvMap>? achievementMap;

  const QuestionOptionsWithSolution({
    Key? key,
    required this.question,
    required this.options,
    required this.achievementMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = AppRepository();
    if (question == null) {
      return Container();
    }
    List<Widget> tableRows = [];
    if (options != null) {
      tableRows = options!.map((option) {
        bool isCorrect = option.isCorrect == 1;
        String checkmark = isCorrect ? '✔' : '';
        String identifier = option.optIdentifier ?? '';
        String optText = option.optText ?? '';

        return Column(
          children: [
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                isCorrect
                    ? Icon(
                        Icons.check_box_outlined,
                        size: Theme.of(context).iconTheme.size,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: Theme.of(context).iconTheme.size,
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$identifier )',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: WebViewPage(
                    isDisableCollapseChild: true,
                    htmlContent: optText ?? '',
                  ),
                ),
              ],
            ),
          ],
        );
      }).toList();
    } else {}

    var questionDetails = [
      FutureBuilder<TblUtilAcademicYear>(
        future:
            appRepository.getTblUtilAcademicYear(question!.academicYear ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          } else if (snapshot.hasData) {
            return ListTile(
              leading: Text(
                'Academic Year :',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              title: Text(
                snapshot.data?.academicYear ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else {
            return Center(
                child: Text(
              "No data found.",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          }
        },
      ),
      FutureBuilder<TblUtilDifficulty>(
        future:
            appRepository.getTblUtilDifficulty(question!.difficultyLev ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          } else if (snapshot.hasData) {
            return ListTile(
              leading: Text(
                'Difficulty Level :',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              title: Text(
                snapshot.data?.difficultyLev ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else {
            return Center(
                child: Text(
              "No data found.",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          }
        },
      ),
      FutureBuilder<TblUtilGrade>(
        future: appRepository.getTblUtilGrade(question!.gradeId ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          } else if (snapshot.hasData) {
            return ListTile(
              leading: Text(
                'Grade :',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              title: Text(
                snapshot.data?.gradeName ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else {
            return Center(
                child: Text(
              "No data found.",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          }
        },
      ),
      FutureBuilder<TblLearnMain>(
        future: appRepository.getTblLearnMain(question!.learnId ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          } else if (snapshot.hasData) {
            return FutureBuilder<TblUtilBranch>(
              future:
                  appRepository.getTblUtilBranch(snapshot.data?.branchId ?? 0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Error: ${snapshot.error}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ));
                } else if (snapshot.hasData) {
                  return ListTile(
                    leading: Text(
                      'Branch :',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    title: Text(
                      snapshot.data?.branchName ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                } else {
                  return Center(
                      child: Text(
                    "No data found.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ));
                }
              },
            );
          } else {
            return Center(
                child: Text(
              "No data found.",
              style: Theme.of(context).textTheme.bodyMedium,
            ));
          }
        },
      ),
      FutureBuilder<TblLearnMain>(
        future: appRepository.getTblLearnMain(question!.learnId ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ));
          } else if (snapshot.hasData) {
            return ListTile(
              leading: Text(
                'Learn :',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              title: Text(
                snapshot.data?.name ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else {
            return Center(
                child: Text(
                  "No data found.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ));
          }
        },
      ),
      if(achievementMap!=null && achievementMap!.isNotEmpty)
      ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        title: Text(
          'Achievements :',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*2/5,
              child: ListView.builder(
                itemCount: achievementMap!.length,
                itemBuilder: (BuildContext context, int index) {
                  int? learnId = achievementMap?[index].achvId;
                  return FutureBuilder<TblLearnMain>(
                    future: appRepository.getTblLearnMain(learnId ?? 0),
                    builder: (context, snapshot)
                    {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                              "Error: ${snapshot.error}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ));
                      } else if (snapshot.hasData) {
                        return ListTile(
                          title: Text(
                            snapshot.data?.itemCode ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            snapshot.data?.name ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      } else {
                        return Center(
                            child: Text(
                              "No data found.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )

    ];
    Widget qAndOps = Column(
      children: [
        WebViewPage(
          isDisableCollapseChild: true,
          htmlContent: question!.questionText ?? '',
        ),
        Column(children: tableRows)
      ],
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollapseChild(
          buttonStyle: CollapseButtonStyle(
            textStyle: Theme.of(context).textTheme.titleMedium,
            iconColor: Theme.of(context).iconTheme.color,
            showText: 'Show Question And Options',
            hideText: 'Hide Question And Options',
          ),
          prefixIcon: const Icon(Icons.question_mark_outlined),
          child: qAndOps,
        ),
        const SizedBox(height: 5),
        WebViewPage(
          prefixIcon: const Icon(Icons.edit_note_sharp),
          showText: 'Show Question Solution',
          hideText: 'Hide Question Solution',
          htmlContent: question!.resolution ?? '',
        ),
        const SizedBox(height: 5),
        CollapseChild(
          buttonStyle: CollapseButtonStyle(
            textStyle: Theme.of(context).textTheme.titleMedium,
            iconColor: Theme.of(context).iconTheme.color,
            showText: 'Show Question Details',
            hideText: 'Hide Question Details',
          ),
          prefixIcon: const Icon(Icons.line_style),
          child: Column(children: questionDetails),
        ),
      ],
    );
  }
}
