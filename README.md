# Interfaces without Storyboards & Nibs
Lighthouse Labs demo project for laying out views programmatically

# Goals
In this class, we covered how we can make interfaces in code, without having to draw them in Interface Builder. This is useful for a few reasons:

* it makes our UI code easily searchable
* it makes our app easier to debug, as changes are not hidden in interface builder’s menus
* it conforms more strictly to MVC, as we stop doing our view setup in our view controllers and view controllers need to know less about each other
* it allows us to safely commit our UI changes to git without worrying about horrible interface builder merge conflicts

## Initial Setup
* Delete the storyboard file (good riddance!)
* Remove the line for “Main storyboard file base name” from info.plist

## Setting Up Our Window and Navigation Stack
We need to accomplish three things in our app delegate’s didLaunch method:

Create our initial navigation stack (instantiating a view controller, navigation controller, tab bar controller with whatever it needs to function—for a UITabBarController, you’ll need to set an array of UIViewControllers to its viewControllers property; for a UINavigationController, you’ll need to set its root view controller in its initializer.
instantiate a UIWindow with a frame equal to our screen’s bounds and and assign it to the app delegate’s window property
set the root of our navigation stack as the window’s rootViewController
make the window the “key” (active) window and make it visible
Setting A Custom view for our view controller
We can optionally override our view controller’s loadView() method and assign a view from a custom subclass to its view property. We do this to move our view’s setup and layout code out of our view controller, in keeping with MVC: the view should care about how it looks; the view controller should care about handling user interaction and communicating state changes. Note that we don’t call super in this override because we do not want to set up view the way the superclass normally would. In Objective C, we can redefine the view property as a member of our subclass…

```
@interface MyViewController ()

@property (nonatomic, strong) MyView *view;

@end

@implementation MyViewController

@dynamic view; // says that we are overriding a superclass property with one of a different type

- (void)loadView
{
    self.view = [[MyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- someMethod
{
    view.property = whatever // this works
}
```
…but in Swift view will always return a UIView, so we’ll need to use a property to access it if we want to change any of its properties or call its methods.

let myView: MyView = MyView(frame: UIScreen.mainScreen.bounds)
override loadView() {
    view = myView
}

func someMethod {
    myView.proerty = whatever
    // view.proerty = whatever // would not work; view is always a UIView
}

## Autolayout In Code
To add a view to our hierarchy, we need to initialize it, add it to an existing view in the hierarchy with its superview’s addSubview(_: UIView) method. The root view will be self for most UIViews, though some classes like UITableViewCell have a contentView that is meant to be the root of their view hierarchies. If we want to use autolayout to position it, we also need set our view’s translateAutoResizingMasksIntoConstraints property to false.

### There are three methods we can use to create constraints:

* The initializer: init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)
* Anchors: myView.leftAnchor.constraintEqualToAnchor(leftAnchor, constant: 0.0, multiplier: 2.0)
* Visual format strings: constraintsWithVisualFormat(_:options:metrics:views:)
The first two options create one constraint at a time, while the third creates multiple constraints. None of these feel particularly efficient to use, though you can check out the video for a demo of how we automate the third method to create a lot of constraints very quickly at Metalab.

You can also check out third-party frameworks for this. I like to use Stevia (https://github.com/freshOS/Stevia), it has nice methods for keeping your code minimal to and styling simple.

Note: Constraints are set as active when you create them. If you ever set their active property to false, they are removed from the constraints array of the view that they are associated with. If you do not have another variable (for example, a property) pointing to them at this point, they will have a reference count of zero and will be deallocated. If you have a constraint that you want to toggle between active and inactive, you need to create a reference to it.

## UIControl targets
You can use targets in place of interface builder’s actions to hook up controls to methods in your view controller. Add targets to UIControl subclasses (like buttons) using the addTarget(_:action:forControlEvents:). As with gesture recognizers, the target will be the view controller (self) and the action will be the selector for a method on that view controller.

## Navigation
You can navigate from one view controller to another in the same ways you do with storyboard, but by using methods instead. If your view controller is embedded in a navigation controller, you can use that view controller’s pushViewController(_: animated:) method to push a new view controller on top of the navigation stack. As with storyboard, you will get a back button to pop the controller automatically. Alternatively, you can use your view controller’s presentViewController(_: animated: completion:) method to present the controller modally (in which case, you’ll need to have the modal controller dismiss itself, or assign it a delegate to do so, as per usual).

In both cases, you will need to initialize the destination view controller yourself, which gives you a lot more control than what you get with segues. This way, you can create a custom initializer to set up the destination view controller with everything it needs, instead of modifying its properties directly from the source view controller—which requires those properties be public, and isn’t good compartmentalization.

## Table View Reuse Identifiers
Finally, while we set reuse identifiers for our cells and header/footer views directly in interface builder, in code, we set these on the table view where we want to use them. In our view controller, we can call registerClass(_:forCellReuseIdentifier:) or registerClass(_:forHeaderFooterViewReuseIdentifier:) for each of the classes we want to use in that table view. Once we have associated them like this, that tableview’s dequeueReusableCellWithIdentifier(_:forIndexPath:) or dequeueReusableHeaderFooterViewWithIdentifier(_:) will dequeue an object of the desired class for that reuse identifier. I highly recommend that you set string constants for your reuse identifiers in your cell and header/footer classes and refer to those, instead using arbitrary strings here, as arbitrary strings provide a vector for errors.
