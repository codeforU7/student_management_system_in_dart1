import 'dart:async';

class DownloadSimulator {
  Stream<int> startDownload() async* {
    print("Starting download...");
    for (int progress = 0; progress <= 100; progress += 10) {
      await Future.delayed(Duration(milliseconds: 500)); // Simulate download time
      yield progress;
    }
    print("Download completed!");
  }
}

void main() {
  DownloadSimulator simulator = DownloadSimulator();
  Stream<int> progressStream = simulator.startDownload();

  progressStream.listen((progress) {
    print("Download progress: $progress%");
  });
}
