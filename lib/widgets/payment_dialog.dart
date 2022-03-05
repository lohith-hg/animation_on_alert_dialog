import 'package:animation_on_alert_dialog/widgets/show_up_animation.dart';
import 'package:animation_on_alert_dialog/widgets/widget_resize_animation.dart';
import 'package:flutter/material.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.lightBlue.shade100,
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width - 90,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          WidgetResizeAnimation(
                            beginScale: 2.4,
                            endScale: 1,
                            duration: 1000,
                            delayTime: 200,
                            widget: Image.asset(
                              'assets/payment_successful.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShowUp(
                            delay: 1000,
                            child: WidgetResizeAnimation(
                              beginScale: 3,
                              endScale: 1,
                              duration: 600,
                              delayTime: 800,
                              widget: const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Payment Successful!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: ShowUp(
                      delay: 1500,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.green, width: 2)),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  'TRACK ORDER',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
