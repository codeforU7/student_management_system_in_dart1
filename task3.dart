import 'dart:async';

// 1. Define Ride States using an Enum for better OOP structure
enum RideStatus { searching, driverFound, arriving, started, completed, cancelled }

class Ride {
  final String pickup;
  final String destination;
  RideStatus status = RideStatus.searching;

  Ride(this.pickup, this.destination);
}

class RideManager {
  StreamController<String>? _controller;
  bool _isCancelled = false;

  // 2. Future: Simulates finding a driver (One-time event)
  Future<String> searchDriver(Ride ride) async {
    print("\n--- Initiating Ride from ${ride.pickup} to ${ride.destination} ---");
    print("Searching for nearby drivers...");
    
    return Future.delayed(Duration(seconds: 3), () {
      if (_isCancelled) return "Search aborted.";
      ride.status = RideStatus.driverFound;
      return "Driver 'Rahul' found! (Rating: 4.8⭐)";
    });
  }

  // 3. Stream: Simulates live updates (Continuous events)
  Stream<String> getLiveUpdates(Ride ride) {
    _controller = StreamController<String>();
    
    List<String> updates = [
      "Driver is 2 minutes away.",
      "Driver has arrived at ${ride.pickup}.",
      "Ride started! Heading to ${ride.destination}.",
      "Passing halfway point...",
      "Ride completed. Hope you had a great trip!"
    ];

    int count = 0;
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_isCancelled) {
        timer.cancel();
        _controller?.add("⚠️ Ride was cancelled by the user.");
        _controller?.close();
      } else if (count < updates.length) {
        _controller?.add("Update: ${updates[count]}");
        count++;
      } else {
        timer.cancel();
        ride.status = RideStatus.completed;
        _controller?.close();
      }
    });

    return _controller!.stream;
  }

  void cancelRide() {
    _isCancelled = true;
    print("\n[Action] User clicked 'Cancel Ride'");
  }
}

void main() async {
  // Setup
  final manager = RideManager();
  final myRide = Ride("Railway Station", "Tech Park");

  // Step 1: Find Driver (Future)
  try {
    String driverInfo = await manager.searchDriver(myRide);
    print(driverInfo);

    // Step 2: Live Tracking (Stream)
    if (myRide.status == RideStatus.driverFound) {
      print("Starting live tracking...\n");
      
      // Simulation: Cancel ride after 5 seconds to test cancellation logic
      // Uncomment the line below to test the cancellation feature:
      // Future.delayed(Duration(seconds: 5), () => manager.cancelRide());

      await for (String update in manager.getLiveUpdates(myRide)) {
        print(update);
      }
    }
  } catch (e) {
    print("Error: $e");
  }

  print("\n--- System Idle ---");
}