# Flutter: Working with routing and navigation
### Simple Navigation 
If you haven't mentioned any route names, and need just normal push and pop then.
Push Navigation:

            onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PingoScreen(), // If u want to pass data, u can pass in arguments
                    ),
                  );
                }
                
Pop Navigation:
    By default if a page is pushed from another page, we will autmotically get a navigation button on the top left corner, which will act as pop navigatio. So no need to write any code for this. And we can customize this with app bar leading property

        appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orangeAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Bingo Screen"),
      ),

But, in some cases we need to pop a page depends on some other interactions, then we can use.

        onPressed: () {
            Navigator.pop(context);
          },

### Routing and route names

While working with routes and route names, it's always better to call onGenerateRoute inside the material app, so that we can handle all fail safe cases

    return MaterialApp(
      initialRoute: MyHomePage.routeName,
      // routes: <String, WidgetBuilder>{},
      onGenerateRoute: (RouteSettings settings) {
        print("Generate Route Called");
        var screen;
        String routeName = settings.name;
        switch (routeName) {
          case MyHomePage.routeName:
            screen = MyHomePage();
            break;
          case BingoScreen.routeName:
            screen = BingoScreen(someDataString: settings.arguments); // Navigate to screen with some data
            break;
          case DingoScreen.routeName:
            screen = DingoScreen(someDataString: settings.arguments);
            break;
          case PingoScreen.routeName:
            screen = PingoScreen(); // Navigate to screen with no data
            break;
          case RingoScreen.routeName:
            screen = RingoScreen();
            break;
        }

        return MaterialPageRoute(builder: (context) => screen);
      },
    );

Once we've mentioned all the routes inside the onRouteGenerate, we can easily handle the navigation on button clicks or tap gestures. Simply call this

        onPressed: () {
                  Navigator.pushNamed(context, "/dingoscreen",
                      arguments: "Hey Dingo !!!");
                },
                
If you don't want to pass any data to next screen, then simply don't mention arguments parameter.
###### The mentioned argument parameter will be handled in the onGenerateRoute callBack. So this arguments data passed to onGenerateRoute callBack and it will initialize the preoper navigation route and will send data accordingly.

## Some of the navigation techniques

        // Normal push navigation
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PingoScreen(),
                    ),
                  );
           
       // Normal pop navigation   
            Navigator.pop(context);
        
        // Push navigation with rotue name
        Navigator.pushNamed(context, "/dingoscreen",
                      arguments: "Hey Dingo !!!");
                      
        Navigator.pushNamed(context, "/dingoscreen");
        
        // Checking a screen can be poped or not
            if (Navigator.canPop(context)) {
                print('Yes, pop possible');
                Navigator.pop(context);
              } else {
                print('end of navigation, no pop');
              }
              
       // If u want to pop the current screen and then go to a new screen
            onPressed: () {
                  Navigator.popAndPushNamed(context, "/ringoscreen");
                  Navigator.of(context).pushReplacementNamed('/"ringoscreen"');
                },
                
        // This will pop all the screens and make pingo screen as main screen, so this is the first screen in stack now
            Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/dingoscreen",
                    (route) => false,
                  );
                  
      // This will pop all the screens until home screen and present pingo screen as current screen
            Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/dingoscreen",
                    ModalRoute.withName("/"),
                  );
                  
      If you gne very furhter in the navigation by pushing multiple levels, then u can directly pop to a particular screen, without going back single step at a time
            Navigator.popUntil(context, ModalRoute.withName("/dingoscreen"));
        

Flutter Info:
## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
