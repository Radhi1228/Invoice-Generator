import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'global.dart';
void pdfHelp(DateTime time,last)
async
{
  var pdf = pw.Document();
  pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build:(context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pw.Container(
                  color: PdfColors.amber,
                  child:  pw.Center(
                    child: pw.Text(
                      "Invoice",
                      style: pw.TextStyle(fontSize: 32, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Date : ${time.day} /${time.month} /${time.year}",
                      style: const pw.TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    pw.Text(
                      "Shop name : $name",
                      style: const pw.TextStyle(fontSize: 18),
                    )
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Time : ${time.hour} : ${time.minute}",
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    pw.Text(
                      "Address : $add",
                      style: const pw.TextStyle(fontSize: 18),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Divider(
                  thickness: 2,
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Container(
                  color: PdfColors.amber100,
                  child:  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Text(
                        "No",
                        style: pw.TextStyle(fontSize: 20),
                      ),
                      pw.Text(
                        "Name",
                        style: pw.TextStyle(fontSize: 20),
                      ),
                      pw.Text(
                        "Prices",
                        style: pw.TextStyle(fontSize: 20),
                      ),
                      pw.Text(
                        "Qaun",
                        style: pw.TextStyle(fontSize: 20),
                      ),
                      pw.Text(
                        "Total Price",
                        style: pw.TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                      children: List.generate(
                          productList.length,
                              (index) => pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                            children: [
                              pw.Text(
                                "$index",
                                style: const pw.TextStyle(fontSize: 18),
                              ),
                              pw.Text(
                                productList[index]['name'],
                                style: const pw.TextStyle(fontSize: 18),
                              ),
                              pw.Text(
                                productList[index]['price'],
                                style: const pw.TextStyle(fontSize: 18),
                              ),
                              pw.Text(
                                productList[index]['quan'],
                                style: const pw.TextStyle(fontSize: 18),
                              ),
                              pw.Text(
                                '${productList[index]['total']}',
                                style: const pw.TextStyle(fontSize: 18),
                              ),
                              pw.SizedBox(
                                height: 25,
                              ),
                            ],
                          ))),
                ),
                pw.Divider(
                  thickness: 2,
                ),
                // Expanded(child: )
                pw.Container(
                  height: 55,
                  width: 60,
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text(
                          "Total Amount : ₹$last",
                          style: const pw.TextStyle(fontSize: 25),
                        )),
                  ),
                )
              ],
            ),
          );
        },
      )
  );
  await Printing.layoutPdf(onLayout: (format) async => pdf.save(),);
}