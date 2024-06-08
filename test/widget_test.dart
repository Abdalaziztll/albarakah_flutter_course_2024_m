// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_service_layter/main.dart';

void main() {
  group("Testing int Varaibles", () {
    int counter = 0;
    test("The Happy Seniore of Store int in varabile", () {
      expect(counter, 0);
    });

    test("The Increament of Counter", () {
      counter++;
      expect(counter, 1);
    });
  });

  group("Test for Http convert URL from Map", () {
    Map<String, String> map = {"name": "Ahmad", "score": "40"};
    String baseurl = "https://www.google.com/api/v1/{name}/hello/{score}";

    String replacefromMapIntoUrl(
        {required String url, required Map<String, String> map}) {
      if (map.length == 2) {
        url = url.replaceAll(
            "{" + map.keys.elementAt(0) + "}", map.values.elementAt(0));

        url = url.replaceAll(
            "{" + map.keys.elementAt(1) + "}", map.values.elementAt(1));

        return url;
      } else {
        return url;
      }
    }

    test("The Happy Scenrio of Map  and HTTP URl", () {
      expect(replacefromMapIntoUrl(map: map, url: baseurl),
          "https://www.google.com/api/v1/Ahmad/hello/40");
    });

    test("The Empty Map Scenroi", () {
      expect(replacefromMapIntoUrl(url: baseurl, map: {}),
          "https://www.google.com/api/v1/{name}/hello/{score}");
    });

    test("The One Parameter Map", () {
      expect(replacefromMapIntoUrl(url: baseurl, map: {"name": "Noor"}),
          "https://www.google.com/api/v1/{name}/hello/{score}");
    });

    test("The Three Map Length", () {
      expect(
          {
            "name": "Noor",
            "name": "Ahmad",
            "score": "40",
            "score": "30",
          }.length,
          2);

      expect(
          replacefromMapIntoUrl(
            url: baseurl,
            map: {
              "name": "Noor",
              "name": "Ahmad",
              "score": "30",
            },
          ),
          "https://www.google.com/api/v1/Ahmad/hello/30");
    });
  });
}
