# youtubeLab-codepath

The menu scaling in step 5 doesn't work. Everything else does. Here is the imgur video:

http://i.imgur.com/s55mam9.gif


Setup:
Create a new project and disable Auto Layout.
Add the image assets above.
MenuViewController and FeedViewController
Create view controllers for the MenuViewController and the FeedViewController
HamburgerViewController
Create a view controller for the HamburgerViewController
In the Storyboard, add a view that will contain the menu and a view that will contain the feed. Create outlets for both these views.
Declare two properties for a MenuViewController and a FeedViewController (same place you put the outlets)
var menuViewController: UIViewController!
var feedViewController: UIViewController!
In viewDidLoad,
programmatically create new view controller copies of the menu and the feed view controllers
Add the view controllers the menu view and the feed view, respectively. Adding Child View Controllers. NOTE: The example in the guide wraps the code in a function for ease of reuse, however you can also just implement the code from the body of the function in the viewDidLoad()
Draggable Feed
Add a pan gesture recognizer to the view that contains the feed to reveal the MenuViewController.
Upon gesture ended, use the velocity to determine if the menu should be fully revealed or hidden.
Bonus: Menu scaling
When the menu is first revealed, it should be at scale 0.9.
As more of the menu is revealed, it should scale to 1.0.
Using View Transforms
