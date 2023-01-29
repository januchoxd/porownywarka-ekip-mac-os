import 'package:flutter/material.dart';
import 'dart:math';

//Kamil
// 100 zł zgłoszenie
//50 zł zamówienie
//1164,29 netto dniówka za 3 pracowników

var nettoKamil;
var nettoDaniel;
var nettoJanusz;

void przeliczWsio(@required ileDniSlider, @required mocInstalacji,
    @required grunt, @required reszta) {
  KosztKamila(ileDniSlider);
  KosztJanusza(ileDniSlider, mocInstalacji);
  KosztDaniela(mocInstalacji, grunt, reszta);
}

void KosztKamila(@required ileDniSlider) {
  nettoKamil =
      (150.00 + (ileDniSlider.roundToDouble() * 1164.29)).toStringAsFixed(2);
}

//do 3,6 maja 600 dniówki chłopacy, potem 350/kWp
void KosztJanusza(@required ileDniSlider, @required mocInstalacji) {
  if (mocInstalacji < 3.6) {
    nettoJanusz = (1950 * ileDniSlider.roundToDouble()).toStringAsFixed(2);
  } else {
    nettoJanusz =
        ((350.00 * mocInstalacji) + (ileDniSlider.roundToDouble() * 750.00))
            .toStringAsFixed(2);
  }
}

//Daniel
// wstepnie blachotrapez jest true wiec tlyko sprawdzam grunt i reszta jak te nie sa true to jako else znaczy ze jest trapez wybrany

void KosztDaniela(@required mocInstalacji, @required grunt, @required reszta) {
  if (grunt == true) {
    if (mocInstalacji <= 3.00) {
      (nettoDaniel = mocInstalacji * 1100).toStringAsFixed(2);
    } else if (mocInstalacji <= 4.00) {
      (nettoDaniel = mocInstalacji * 1100).toStringAsFixed(2);
    } else if (mocInstalacji <= 10.00) {
      (nettoDaniel = mocInstalacji * 650).toStringAsFixed(2);
    } else if (mocInstalacji <= 25.00) {
      (nettoDaniel = mocInstalacji * 600).toStringAsFixed(2);
    } else {
      (nettoDaniel = mocInstalacji * 500).toStringAsFixed(2);
    }
  } else if (reszta == true) {
    if (mocInstalacji <= 3.00) {
      (nettoDaniel = mocInstalacji * 750).toStringAsFixed(2);
    } else if (mocInstalacji <= 4.00) {
      (nettoDaniel = mocInstalacji * 750).toStringAsFixed(2);
    } else if (mocInstalacji <= 10.00) {
      (nettoDaniel = mocInstalacji * 650).toStringAsFixed(2);
    } else if (mocInstalacji <= 25.00) {
      (nettoDaniel = mocInstalacji * 600).toStringAsFixed(2);
    } else {
      (nettoDaniel = mocInstalacji * 525).toStringAsFixed(2);
    }
  } else {
    if (mocInstalacji <= 3.00) {
      (nettoDaniel = mocInstalacji * 750).toStringAsFixed(2);
    } else if (mocInstalacji <= 4.00) {
      (nettoDaniel = mocInstalacji * 550).toStringAsFixed(2);
    } else if (mocInstalacji <= 10.00) {
      (nettoDaniel = mocInstalacji * 475).toStringAsFixed(2);
    } else if (mocInstalacji <= 25.00) {
      (nettoDaniel = mocInstalacji * 420).toStringAsFixed(2);
    } else {
      (nettoDaniel = mocInstalacji * 375).toStringAsFixed(2);
    }
  }
}
