# Riverpod examples

Examples of state management in [Flutter](https://flutter.dev/) apps
with [Riverpod library](https://riverpod.dev/).

Examples used in the
course [IDATA2503 Mobile applications](https://www.ntnu.edu/studies/courses/IDATA2503)
at [NTNU](https://ntnu.edu), campus [Aalesund](https://www.ntnu.edu/alesund).

The examples show the following:

1. A simple [counter application](01%20counter) using `StateProvider`. The `HomePage` widget
   extends `ConsumerWidget` and hence the whole screen is re-rendered on every change of the
   counter.
2. [Another example](02%20consumer) implementing exactly the same logic, just using `Consumer`
   widget to wrap only those widgets which really depend on the counter (either read or change
   value). This reduces the number of widget re-renders. Check out the print-outs in the console for
   this and the previous project to see the difference.
3. An [example showing how to keep a list of objects](03%20item-list) in a `StateNotifierProvider`
   and how to provide supported modification actions in a `StateNotifier`.
4. An example of using [Firebase authentication with Riverpod](04%20authentication). Several
   providers are used here:
    1. A static `Provider` which provides a singleton reference to `AuthService`.
    2. A `StateProvider` which signals about the status of authentication - whether authentication
       is currently in progress. This is useful for enabling/disabling buttons, etc.
    3. A `StreamProvider` which issues a new update every time the user authentication information
       changes.