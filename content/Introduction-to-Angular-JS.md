## Basic Features

Angular is a JavaScript framework that provides many useful tools and patterns to make it easier and faster to build complex front end application. It can be used in conjuction with a pluggable router and server-side url rewrites to drive a complete complete website, or on it's own with a small amount of code to build widgets or parts of a larger site.

Straightforward resource models, two-way bindings, form flow control and validation, simple and powerful animation and customizable components are some of the nice things Angular streamlines for you. It may seem idiomatic, or slightly backwards to once again be working with lots of special inline markup, but you'll soon realize how powerful this framework is. What used to be hard to control and took many lines of code, is now trivial.

### Directives Basics

One way of writing Angular applications is with a focus on directives, which are Angular's version of web components. You will design your application in smaller pieces, each of which has it own purpose. Some components contain more complexity than others, but may contain some or all of its logic, layout and basic styling. To give you an example of an Angular directive:

```html

<todo-item class="urgent" owner="owner" task="Make a dinner" />

```

You can see a couple of basic features of directives here. We have defined a couple of custom properties in form of `owner` and `task`. `owner` is something that is bound to a variable named `owner` that exists within the same scope as our directive. For `task` we provide a fixed value. This value can be accessed from the scope in the directive's `controller` or `link` function.

In practice you would most likely structure this a little differently to fit your data model better. That goes a little beyond basic Angular, though.

Angular has some special built-in directives, including `ng-repeat`, that can help us render a list of Todo Items:

```html
<ul>
  <li ng-repeat="(todoName, todoItem) in todoItems">
    <todo-item owner="todoItem.owner" task="todoItem.task" />
  </li>
</ul>
```

### Entire Component

To give you a better idea of what components look like, let's expand our `TodoItem` example into code (ES6 + html). I've done this below and will walk you through it:

*component.html*
```html
<div class='TodoItem'>
  <span class='TodoItem-owner'>{{ todo.owner }}<span>
  <span class='TodoItem-task'>{{ todo.task }}</span>
  <span class='TodoItem-likes'>{{ todo.likes }}</span>
  <span class='TodoItem-like' ng-click="todo.likes = todo.likes + 1">Like</span>
</div>
```

*component.js*
```javascript
import angular from 'angular';
import template from './component.html';

angular
  .module('TodoListDirective', [])
  .directive('TodoList', function($scope) {
    return {
      scope: true,
      template: template,
      replace: true,
      controllerAs: 'todo',
      controller: function(attrs) {
        this.owner = attrs.owner;
        this.task = attrs.task;
        this.likes = 0;
      }
    }
  });
```

You can see some basic features of an Angular directive above. We're be using the newer `controllerAs` syntax to keep our scope namespace tidy and componetized, and creating an isolate scope for our directive by setting `scope = true`. This keeps the $scope properties in the directive from leaking up. Then we bind the initial values of the directive to the controller object to match directive markup. For fun, another built-in Angular directive -- `ng-click` -- to the likes element to demonstrate how powerful they can be. When clicked, the expression inside is evaluated. In this case we can implement an extra feature, liking. The current implementation just increments the number of likes per component.

In practice you would transmit like counts to a backend and add some validation there but this is a good starting point for understanding how state works in Angular.

In this example CSS naming has been modeled after [Suit CSS](http://suitcss.github.io/) conventions as those look clean to me. That's just one way to deal with it.

### Dealing with Manipulation

Let's say we want to modify the owner of our TodoItems. For the sake of simplicity let's expect it's just a string and owner is the same for all TodoItems. Based on this design it would make sense to have an input for owner at our user interface. Two way bindings in Angular make this incredibly simple. A naive implementation would look something like this:

```html
<div class="ChangeOwner'>
  <input type="text" ng-model="owner" ng-init="owner = 'John Doe'" />
</div>
<todo-item class="urgent" owner="owner" task="Make a dinner" />
```

### Testing

If you get serious about the Todo app, Angular makes testing pretty easy. You can set up Karma for unit tests, and Angular provides a test harness called Protractor for end to end testing.