# Object Oriented Ruby Continued
## 1st Segment - Review of Object Instantiation

Throw out questions:

```rb
class Dog
end

lennon = Dog.new("Lennon Snow", "11 months", "Pomeranian")
```
### What will happen if we try to run the code above?

...
### What do we need to do or change to get this code to work?

...

Say we want to be able to do:

```rb
lennon.name #=> "Lennon Snow"
```
and
```rb
lennon.age #=> "11 months"
```
and
```rb
lennon.breed #=> "Pomeranian
```

### What do we need to add/change in the class to support this?

...

Finally, let's say we want to be able to create a new Dog like this:

```rb
Dog.new(name: "Lennon Snow", age: "11 months", breed: "Pomeranian")
```

How would the class have to change to support this?

## Activity 1

Rework the computer class from yesterday to utilize mass assignment upon initialization. Refactor the code to take advantage of the attribute macros you learned about in labs so we can cut down on the code inside of the class. Run the specs using the `rspec` command to track your progress. (15 minutes in breakouts)

When we return, be prepared to share your solution with the group.
Confirm:
- Created Instances
- reworked first_computer and second_computer methods to accept a hash of attributes on instantiation.

### What Errors Did you hit?

-

## Discussion Questions

What does the initialize method do?

When does the initialize method get called?

When do we need an initialize method and when can we do without it?


**Take 5 minute break after discussion**

## 2nd Segment - Keeping track of the Computers we create

### Group Discussion in Breakouts - Pick a Scribe and have them [fill in the group's answers here](https://hackmd.io/@dlm/phase3-lecture-3-classes-and-instances-discussion-7-21-21)

### What if we wanted to keep track of all of the computers that we create? Where would we store them and why?

...
### What's the difference between a class variable and an instance variable?

...

### What's the difference between a class method and an instance method? (think both about how they're defined and how they're called) 

...

### What does `self` refer to within a class method?

...
### What does `self` refer to within an instance method?

...
### Can we access class variables from instance methods?

...

### Can we access instance variables from class methods?

...

### Setting up Activity 

Let's say we add a class variable called `@@all` to the computer class so that we can store an array of the computers we create. After we've done that, we can set up a method called `save` that will store a computer inside of the that array.

What kind of method should `save` be? 

What will we be calling `save` on, an instance or the class?

let's code the `save` method together and then breakout again to add some additional functionality. 

```rb
def save
  # insert code here
end
```

## Activity 2 - build an all method that returns an array of all saved computers

Now that we've got a save method built out that will store computer instances within a class variable called `@@all`, your tasks will be to:
- add the `#save` method that will store computer instances in `@@all` (if you haven't already)
- add a method called `.all` that will return all of those computers.
- add a method called `.create` that will:
  - accept a hash of attributes (just like initialize)
  - use that hash to create a new computer
  - save the computer to `@@all`
  - return the computer 
- add a method called `.backed_up` that will return an array of all computers that have been backed up.


### Final Discussion questions

When did you use the `self` keyword?

What code did you write that didn't use `self` but could have used `self` (to call a method accessible in the same scope)?

How do you determine what `self` will refer to within a method?

What are some examples of metaprogramming that we've used in our code today?