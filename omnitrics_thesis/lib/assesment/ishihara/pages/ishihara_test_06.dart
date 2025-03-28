import 'package:flutter/material.dart';
import 'package:omnitrics_thesis/assesment/ishihara/data/plates_config.dart';
import 'package:omnitrics_thesis/assesment/ishihara/pages/ishihara_test_07.dart';

class IshiharaTest06 extends StatefulWidget {
  const IshiharaTest06({Key? key}) : super(key: key);

  @override
  _IshiharaTest06State createState() => _IshiharaTest06State();
}

class _IshiharaTest06State extends State<IshiharaTest06> {
  final TestConfig config = testConfigs[5];
  int selectedOption = -1;
  bool answerSubmitted = false;
  Color? nextButtonColor;

  void _handleOptionTap(int index) {
    if (answerSubmitted) return;
    setState(() {
      selectedOption = index;
    });
  }

  void _handleNextTap() {
    if (selectedOption == -1 || answerSubmitted) return;

    setState(() {
      answerSubmitted = true;
      if (selectedOption == config.correctAnswerIndex) {
        nextButtonColor = Colors.green;
      } else {
        nextButtonColor = Colors.red;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IshiharaTest07()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ishihara Test',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade700,
                Colors.deepPurple.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image section
            Expanded(
              flex: 4,
              child: Center(
                child: Image.asset(
                  config.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Options section
            Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: config.options.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: ElevatedButton(
                        onPressed: () => _handleOptionTap(index),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (states) {
                              if (selectedOption == index) {
                                return Colors.deepPurple.shade700;
                              }
                              return Colors.deepPurple.shade200;
                            },
                          ),
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (states) {
                              if (selectedOption == index) {
                                return Colors.white;
                              }
                              return Colors.black;
                            },
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          minimumSize:
                              WidgetStateProperty.all(const Size(300, 50)),
                        ),
                        child: Text(
                          config.options[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Next button
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: ElevatedButton(
                  onPressed: selectedOption != -1 && !answerSubmitted
                      ? _handleNextTap
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>(
                      (states) {
                        // If answer has been submitted, use the nextButtonColor
                        if (answerSubmitted && nextButtonColor != null) {
                          return nextButtonColor!;
                        }
                        // Otherwise, use a darker grey for the Next button
                        return Colors.deepPurple.shade200;
                      },
                    ),
                    foregroundColor:
                        WidgetStateProperty.resolveWith<Color>(
                      (states) {
                        if (answerSubmitted && nextButtonColor != null) {
                          return Colors.white;
                        }
                        return Colors.black;
                      },
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize:
                        WidgetStateProperty.all(const Size(300, 50)),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
