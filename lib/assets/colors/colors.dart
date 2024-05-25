import 'package:flutter/material.dart';

///Colors in App
abstract class AppColors {
  static const _white = Color(0xffFFFFFF);
  static const _black = Color(0xff000000);
  static const _pumpkin = Color(0xffFF831B);
  static const _pumpkin50 = Color(0x80FF831B);
  static const _scarlet = Color(0xffFF3300);
  static const _scarlet50 = Color(0x80FF3300);
  static const _darkGray = Color(0xffA3A3A3);
  static const _nero = Color(0xff1C1C1C);
  static const _whiteSmoke = Color(0xffF2F2F2);
  static const _mayaBlue = Color(0xff4DAAF8);
  static const _suvaGrey = Color(0xff8F8F8F);
  static const _malachite = Color(0xff13B541);
  static const _lemon = Color(0xffFFE81B);
  static const _gainsboro = Color(0xffDADADA);
  static const _whiteSmoke2 = Color(0xffF7F7F7);
  static const _dimGray = Color(0xff616161);
  static const _kournikova = Color(0xffFACF61);
  static const _mangoTango = Color(0xffCC9200);
  static const _sangria = Color(0xff991E00);
  static const _pigmentGreen = Color(0xff00992A);
  static const _mistyRose = Color(0xffFFEBE6);
  static const _whiteSmoke1 = Color(0xffF0F0F0);
  static const _forestGreen = Color(0xff239041);
  static const _whiteLilac = Color(0xffEAEAED);
  static const _blackRussian = Color(0xff111014);
  static const _tangerine = Color(0xffCFA600);
  static const _safetyOrange = Color(0xffFF6310);
  static const _tangaroa = Color(0xff0C161D);

  static const white = _white;
  static const storiesGradientColor = _tangaroa;
  static const black = _black;
  static const blackRussian = _blackRussian;
  static const forestGreen = _forestGreen;
  static const whiteSmoke1 = _whiteSmoke1;
  static const mainOrange = _pumpkin;
  static const mainOrange50 = _pumpkin50;
  static const mistyRose = _mistyRose;
  static const appBarOrange = _safetyOrange;
  static const red = _scarlet;
  static const red50 = _scarlet50;
  static const grey1 = _suvaGrey; //8E8E8E
  static const grey2 = _darkGray;
  static const grey3 = _gainsboro; //D9D9D9 //E0E0E0
  static const grey4 = _whiteSmoke;
  static const grey5 = _whiteSmoke2;
  static const mainDark = _nero;
  static const blue = _mayaBlue;
  static const green = _malachite;
  static const yellow = _lemon;
  static const greySecondary = _dimGray;
  static const yellow2 = _kournikova;
  static const mangoTango = _mangoTango;
  static const darkRed = _sangria;
  static const pigmentGreen = _pigmentGreen;
  static const drawerDividerColor = _whiteLilac;
  static const onTheWayStatus = _tangerine;

  // static List<BoxShadow> componentShadow = [
  //   BoxShadow(
  //     color: AppColors.componentShadow1,
  //     blurRadius: 20,
  //     offset: Offset(0, 6),
  //     spreadRadius: -12,
  //   ),
  //   BoxShadow(
  //     color: AppColors.componentShadow2,
  //     blurRadius: 1,
  //     offset: Offset(0, 2),
  //     spreadRadius: -1,
  //   )
  // ];

  static const mainGradient = LinearGradient(
    begin: Alignment(-0.05, -1.00),
    end: Alignment(0.05, 1),
    colors: [
      mainOrange,
      red,
    ],
  );

  static const bottomWhiteGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [
      white,
      Colors.transparent,
    ],
  );

  static const yellowGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [yellow2, mangoTango],
  );

  static const redGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [red, darkRed],
  );

  static const mainButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      mainOrange,
      red,
    ],
  );
  static const mainButtonGradient50 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      mainOrange50,
      red50,
    ],
  );
  static const greenGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [green, pigmentGreen],
  );
  static const statusShadow = BoxShadow(
    color: Color(0x4DFF831B),
    offset: Offset(0, 7),
    blurRadius: 12,
    spreadRadius: 0,
  );

// Main palette (http://www.color-blindness.com/color-name-hue/).

/*
100% — FF
99% — FC	89% — E3	79% — C9	69% — B0	59% — 96	49% — 7D	39% — 63	29% — 4A	19% — 30	9% — 17
98% — FA	88% — E0	78% — C7	68% — AD	58% — 94	48% — 7A	38% — 61	28% — 47	18% — 2E	8% — 14
97% — F7	87% — DE	77% — C4	67% — AB	57% — 91	47% — 78	37% — 5E	27% — 45	17% — 2B	7% — 12
96% — F5	86% — DB	76% — C2	66% — A8	56% — 8F	46% — 75	36% — 5C	26% — 42	16% — 29	6% — 0F
95% — F2	85% — D9	75% — BF	65% — A6	55% — 8C	45% — 73	35% — 59	25% — 40	15% — 26	5% — 0D
94% — F0	84% — D6	74% — BD	64% — A3	54% — 8A	44% — 70	34% — 57	24% — 3D	14% — 24	4% — 0A
93% — ED	83% — D4	73% — BA	63% — A1	53% — 87	43% — 6E	33% — 54	23% — 3B	13% — 21	3% — 08
92% — EB	82% — D1	72% — B8	62% — 9E	52% — 85	42% — 6B	32% — 52	22% — 38	12% — 1F	2% — 05
91% — E8	81% — CF	71% — B5	61% — 9C	51% — 82	41% — 69	31% — 4F	21% — 36	11% — 1C	1% — 03
90% — E6	80% — CC	70% — B3	60% — 99	50% — 80	40% — 66	30% — 4D	20% — 33	10% — 1A	0% — 00
*/
}
