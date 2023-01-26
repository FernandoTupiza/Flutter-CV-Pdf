
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../data.dart';

const PdfColor blue = PdfColor.fromInt(0xaed6f1);
const PdfColor lightBlue = PdfColor.fromInt(0x92c1e0);
const sep = 230.0;

Future<Uint8List> generateResume(PdfPageFormat format, CustomData data) async {
  final doc = pw.Document(title: 'CV_Tupiza_Alexander', author: 'Alexander Tupiza');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/Alexander.png')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text('ALEXANDER FERNANDO TUPIZA CARRERA',
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        pw.Text('Contacto',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: blue)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('N°Celular:'),
                                pw.Text('Email:'),
                                pw.Text('Dirección: '),
                              ],
                            ),
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('0939305304'),
                                pw.Text('fernandotupiza@hotmail.com'),
                                pw.Text('Geovanni Calles y Alava N9-159'),
                              ],
                            ),
                            pw.Padding(padding: pw.EdgeInsets.zero)
                          ],
                        ),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Text('Objetivo',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: blue)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text(
                                    'Desarrollar mi talento en un medio vivencial  y profesional  propicio para el '),
                                pw.Text(
                                    'intercambio, el debate  y la realización de  las ideas complejas y  novedosas '),
                                pw.Text(
                                    'brindando  el conocimiento adquirido  y  enfrentandome  a  nuevos   retos  '),
                                pw.Text(
                                    ' y desafios  que se  presentaran,  las cuales  me  ayudaran  a  ser  una  gran '),
                                pw.Text(
                                    'profesional con conocimientos y valores'),
                              ],
                            ),
                            pw.Padding(padding: pw.EdgeInsets.zero)
                          ],
                        ),
                      ],
                    ),
                  ),
                  _Category(title: 'Formación'),
                  pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                  _Block(
                    title: 'Escuela Maria Teresa Davila"',
                    descripcion: 'Educación Primaria',
                  ),
                  _Block(
                    title: 'Unidad Educativa "Luxemburgo"',
                    descripcion: 'Bachiller Informático',
                  ),
                  _Block(
                    title: 'Escuela Politécnica Nacional',
                    descripcion:
                        'En curso, Carrera de Tecnologia de Desarrollo de Software',
                  ),
                  pw.Padding(padding: const pw.EdgeInsets.only(top: 35)),
                  _Category(title: 'Experiencia como Pasante'),
                  _Block(
                    title: 'AHCORP Ecuador CIA.LTDA',
                    descripcion: 'Arquitectura de Computadoras .',
                  ),
                  _Block(
                    title: 'MDS Sistemas',
                    descripcion:
                        'Análisis de Computadoras .',
                  ),
                  _Block(
                    title: 'EP PetroEcuador',
                    descripcion:
                        'Creación de Sistemas con lenguajes de programación PHP y gestiona en base de datos con el gestor PHPMyadmin.',
                  ),
                  _Category(title: 'Experiencia Acádemica'),
                  _Block(
                    descripcion:
                        'Registro estudiantil de calificacion, usando el lenguaje de programación C++',
                    title: 'Primer Semestre',
                  ),
                  _Block(
                    descripcion:
                        'Arquitectura de computadoras.',
                    title: 'Segundo Semestre',
                  ),
                  _Block(
                    descripcion:
                        'Recopilación de Datos de varias fuentes',
                    title: 'Tercer Semestre',
                  ),
                  _Block(
                    descripcion: 'Autenticacion con reconocimiento Facial',
                    title: 'Cuarto Semestre',
                  ),
                  _Block(
                    descripcion:
                        'Implementacion de Docker en Next.js, logrando utilizar menos recurso de nuestro kernel',
                    title: 'Quinto Semestre',
                  ),
                ],
              ),
            ),
            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.ClipOval(
                          child: pw.Container(
                            width: 250,
                            height: 200,
                            color: lightBlue,
                            child: pw.Image(profileImage),
                          ),
                        ),
                          pw.Padding(padding: const pw.EdgeInsets.only(top: 65)),
                          _Category(title: 'Habilidades y Aptitudes'),
                          _Block(
                            title: 'Idiomas',
                            descripcion: 'Ingles: Medio Español:Nativo',
                          ),
                          _Block(
                            title: 'Intereses',
                            descripcion: 'Deporte, Leer, Fotografía, Música',
                          ),
                          _Block(
                            title: 'Habilidades',
                            descripcion:
                                'Trabajo en grupo, Capacidad de comunicación, Actitud positiva y creativa.',
                          ),

                      ],
                    ),
                  ),
                  _Category(title: 'Cursos y Certificados'),
                  _Block(
                    title: 'Tecnico en Reparación de Celulares',
                    descripcion:
                        'La capacitacion del curso lo realice en el centro SOLARIS, donde me impartieron fundamentos y reparacion de un celular.',
                  ),
                  _Block(
                    title: 'Jornada de Ciencia e Innovacion de la EPN',
                    descripcion:
                        'Sistema de autenticacion con reconocimiento facial y alerta de intrusos mediante SMS',
                  ),
                  _Block(
                    title: 'Curso de manejo Vehicular',
                    descripcion: 'Licencia Tipo: B',
                  ),
                  _Category(title: 'Habilidades Informaticas'),
                  _Block(
                    title: 'Programación',
                    descripcion:
                        'Ejecucion de la programacion en diferentes tipos de lenguajes como es Python, PHP, JavaScript, C.',
                  ),
                  _Block(
                    title: 'Arquitectura de Computadoras',
                    descripcion:
                        'Mantenimiento de Computadoras tanto portatiles como de mesa',
                  ),
                  _Block(
                    title: 'Base de Datos',
                    descripcion: 'Gestion de base de datos relacionales y no relacionales',
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    required this.descripcion,
    this.icon,
  });

  final String title;
  final String descripcion;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: blue,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightBlue, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: blue, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(descripcion),
                  // pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightBlue,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => blue;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
