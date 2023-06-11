import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/services/order/order_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../payment-view-model.dart';

class ShowModalPayment extends StatefulWidget {
  final Function() onPressed;
  final DateTimeRange? selectedDateRange;
  final int officeId;
  const ShowModalPayment(
      {super.key,
      required this.onPressed,
      required this.selectedDateRange,
      required this.officeId});

  @override
  State<ShowModalPayment> createState() => _ShowModalPaymentState();
}

class _ShowModalPaymentState extends State<ShowModalPayment> {
  String convertDateTime(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Widget buildListVirtualAccount(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.setSelectedValue('Virtual Account BNI');
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: provider.selectedValue == 'Virtual Account BNI'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BNI',
                            style: setTextStyle(NeutralColor().neutral10)
                                .copyWith(fontWeight: medium, fontSize: 16),
                          ),
                          Text(
                            'Gratis Biaya Pembayaran',
                            style: setTextStyle(
                                    PrimaryColor().onPrimaryFixedVariant)
                                .copyWith(fontWeight: semiBold, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Virtual Account BNI',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: provider.selectedValue,
                    onChanged: (value) {
                      provider.setSelectedValue(value!);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              provider.setSelectedValue('Virtual Account BCA');
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: provider.selectedValue == 'Virtual Account BCA'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/bca.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BCA',
                        style: setTextStyle(NeutralColor().neutral10)
                            .copyWith(fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Virtual Account BCA',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: provider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        provider.setSelectedValue(value!);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildListTransferBank(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.setSelectedValue('Transfer Bank BNI');
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: provider.selectedValue == 'Transfer Bank BNI'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BNI',
                            style: setTextStyle(NeutralColor().neutral10)
                                .copyWith(fontWeight: medium, fontSize: 16),
                          ),
                          // Text(
                          //   'Gratis Biaya Pembayaran',
                          //   style: setTextStyle(
                          //           PrimaryColor().onPrimaryFixedVariant)
                          //       .copyWith(fontWeight: semiBold, fontSize: 11),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Transfer Bank BNI',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: provider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        provider.setSelectedValue(value!);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              provider.setSelectedValue('Transfer Bank BCA');
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: provider.selectedValue == 'Transfer Bank BCA'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/bca.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BCA',
                        style: setTextStyle(NeutralColor().neutral10)
                            .copyWith(fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Transfer Bank BCA',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: provider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        provider.setSelectedValue(value!);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildListEWallet(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: NeutralColor().neutral90,
          width: 1.0,
        ),
      ),
      child: Text(
        'Mohon maaf fitur ini belum tersedia',
        style: setTextStyle(NeutralColor().neutral90)
            .copyWith(fontWeight: medium, fontSize: 14),
      ),
    );
  }

  Widget buildListTotalPembayaran(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga Unit',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 20.999',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Diskon',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 0',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pajak',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 2.100',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: setTextStyle(
                  NeutralColor().neutral10,
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 23.099',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      return IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: widget.onPressed,
                        // () {
                        //   Navigator.pop(context);
                        // },
                        icon: const Icon(Icons.arrow_back),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Pilih Metode Pembayaran",
                        style: setTextStyle(SourceColor().black)
                            .copyWith(fontWeight: semiBold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFF1F0F4),
              height: 3,
              thickness: 3,
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, right: 18.0, left: 18.0),
                child: Column(
                  children: [
                    // Virtual Acount
                    //=============================================================
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/payment/credit_card.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Virtual Account",
                                        style: setTextStyle(
                                                NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                      ),
                                      Text(
                                        "Verifikasi Otomatis",
                                        style: setTextStyle(
                                                NeutralVariantColor()
                                                    .neutralVariant30)
                                            .copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.toggleVirtualVisible();
                                },
                                icon: provider.isVirtualVisible
                                    ? SvgPicture.asset("assets/detail/up.svg")
                                    : SvgPicture.asset(
                                        "assets/detail/down.svg"),
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                        provider.isVirtualVisible
                            ? buildListVirtualAccount(context)
                            : Container(),
                      ],
                    ),
                    // Transfer Bank
                    //=============================================================
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/payment/account_balance.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Transfer Bank",
                                        style: setTextStyle(
                                                NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.toggleBankVisible();
                                },
                                icon: provider.isBankVisible
                                    ? SvgPicture.asset("assets/detail/up.svg")
                                    : SvgPicture.asset(
                                        "assets/detail/down.svg"),
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                        provider.isBankVisible
                            ? buildListTransferBank(context)
                            : Container(),
                      ],
                    ),
                    // E-Wallet
                    //=============================================================
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/payment/account_balance_wallet.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "E-Wallet",
                                        style: setTextStyle(
                                                NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.toggleEWalletVisible();
                                },
                                icon: provider.isEWalletVisible
                                    ? SvgPicture.asset("assets/detail/up.svg")
                                    : SvgPicture.asset(
                                        "assets/detail/down.svg"),
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                        provider.isEWalletVisible
                            ? buildListEWallet(context)
                            : Container(),
                      ],
                    ),
                    // Total Pembayaran
                    //=============================================================
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pembayaran",
                                style: setTextStyle(NeutralColor().neutral10)
                                    .copyWith(fontWeight: medium, fontSize: 14),
                              ),
                              Row(
                                children: [
                                  Text(
                                    provider.isTotalPembayaranVisible
                                        ? ''
                                        : 'IDR 23.099',
                                    style:
                                        setTextStyle(NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.toggleTotalPembayaranVisible();
                                    },
                                    icon: provider.isTotalPembayaranVisible
                                        ? SvgPicture.asset(
                                            "assets/detail/up.svg")
                                        : SvgPicture.asset(
                                            "assets/detail/down.svg"),
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        provider.isTotalPembayaranVisible
                            ? buildListTotalPembayaran(context)
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(PrimaryColor().primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    var res = OrderService().createOrder(
                      officeId: widget.officeId,
                      startDate: convertDateTime(
                          widget.selectedDateRange!.start.toString()),
                      endDate: convertDateTime(
                          widget.selectedDateRange!.end.toString()),
                      paymentId: 'va-bni',
                    );
                    var transactionId = res.then((value) {
                      return value.data.idTransaction;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureBuilder(
                          future: transactionId,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DetailPaymentScreen(
                                  paymentId: snapshot.data!);
                            } else {
                              return Scaffold(
                                appBar: AppBar(
                                  iconTheme:
                                      const IconThemeData(color: Colors.black),
                                  title: Text(
                                    'Detail Pembayaran',
                                    style:
                                        setTextStyle(NeutralColor().neutral12)
                                            .copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 16),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                body: Container(
                                  color: Colors.white,
                                  child: const Center(
                                    child:
                                        CircularProgressIndicator(), // Tampilkan loading indicator
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Bayar",
                    style: setTextStyle(SourceColor().white)
                        .copyWith(fontWeight: medium, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
