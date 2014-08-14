# Learning Ruby

## Why Ruby?

Ruby is a dynamic object-oriented language that has minimalistic syntax (depending on what you are used to) and interesting features. Here are some.

### Everything is an object, every operation a method call

Ruby is truly object oriented. Numbers are instances of classes, `1.+(2)` is the same as `1 + 2`. You can ask any object for methods. `1.public_methods` or even `true.class`.

### Blocks  
Blocks are a very lightweight and powerful construct. Do you want to find even numbers and sort them by absolute value? `[1, -4, 2, -9, 0].select { |n| n.even? }.sort_by {|n| n.abs }` returns `[0, 2, -4]`. Expressive, readable and powerful.

### Open classes  
You can add any method you like to any existing class. Surely you can burn your fingers, but with great power comes great responsibility.

### Mixins  
What do you have to actually write in your language when you want to make a class a Singleton (the design pattern)? Probably something like this
  
```ruby 
class Database
  def self.instance
    if @instance.nil?
      @instance = new
    end
    return @instance
  end
end
```
  
Besides that this flawed code (not thread-safe), it also shows a weakness in programming language. You can't abstract this. If you were to create and abstract `Singleton` class you can't inherit from any other class. This is very restrictive. How do you make a class singleton in Ruby. You just say so.
  
```ruby
require 'singleton'
  
class Database
  include Singleton
end
```
  
### Metaprogramming  
Ruby is often used for creating nice domain specific languages (DSL). You want to create a getter and setter method for a field? Just write `attr_writer :my_field`. Done.

Now imagine how you can combine all these features together. Of course Ruby has it's flaws. For starters it's slow and memory hungry. But for building web applications that's irrelevant. Yes, you can scale it.

## Language flaws and the expression problem

The expression problem is a nice trick you can use to evaluate expressiveness of programming languages. 

> The goal is to define a datatype by cases, where one can add new cases to the datatype and new functions over the datatype, without recompiling existing code, and while retaining static type safety (e.g., no casts).

Let's try this in Ruby. We want to create a program for printing mathematical expressions. 

```ruby
class Number < Struct.new(:value)
  def print
    value
  end
end

class Binary < Struct.new(:left, :right)
  def print
    "(#{left.print} #{operator_symbol} #{right.print})"
  end
end

class Plus < Binary
  def operator_symbol
    '+'
  end
end

class Times < Binary
  def operator_symbol
    '*'
  end
end
```

And here is how you can use it. 

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Number.new(5))
)

puts expression.print
# => (1 + (2 * 5))
```

So far so good. Now how about adding a new datatype **without touching existing code**.

```ruby
class Negation < Struct.new(:expression)
  def print
    "-#{expression.print}"
  end
end
```

And how to use it.

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Negation.new(Number.new(5)))
)

puts expression.print
# => (1 + (2 * -5))
```

An easy task for almost any object-oriented language. But try that in a functional language. Now to the interesting part. Let's add a new operation: Evaluating expressions and again **without touching existing code**. Imagine you are extending an existing third-party library.

```ruby
class Number
  def eval
    value
  end
end

class Plus
  def eval
    left.eval + right.eval
  end
end

class Times
  def eval
    left.eval * right.eval
  end
end

class Negation
  def eval
    -expression.eval
  end
end
```

Notice how we used open classes and added new methods to existing classes. Here is how you can use it.

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Negation.new(Number.new(5)))
)

puts expression.eval
# => -9
```

Nice!

## Learning Ruby

_**Task:** Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build)._

_**Task:** Install Ruby 2.1.2 using `rbenv install 2.1.2` command._

_**Task:** Install [Rubymine IDE](http://www.jetbrains.com/ruby/)._
 
_**Task:** Download and extract [Ruby Koans](http://rubykoans.com/)._
 
_**Task:** Open Ruby Koans in Rubymine, run `path_to_enlightenment.rb` and follow the instructions. This normally takes several hours._ If you get stuck consult the frequently asked questions section bellow.

*NOTE: When possible do this in pairs (pair programming, one computer, two people). If one from the pair is more experienced, as a rule of thumb for learning, the other one should be using the keyboard. This way the experienced one is learning to explain better and the other one learns faster by doing more.* 

*NOTE: Consider switching pairs in fixed time intervals (20-30minutes), so people start to know each other better and solve blocking tasks, other pairs already solved.* 

---

## Gaining broad knowledge

* [Ruby Documentation](http://www.ruby-doc.org/)


## Digging deeper

* **Book: [Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104)** _(448 pages)_  
  It’s easy to write correct Ruby code, but to gain the fluency needed to write great Ruby code, you must go beyond syntax and absorb the “Ruby way” of thinking and problem solving.

* **Podcast: [Ruby Rouges](http://rubyrogues.com/)**

* **Newsletter: [Ruby Weekly](http://rubyweekly.com/)**


## Frequently Asked Questions

### Blocks
Blocks will look like magic to you at first since experienced Rubyist use the most implicit form how to write them. Lets look at the most explicit form first.  
    
```ruby
def twice(&block)
  block.call
  block.call
end

twice { puts 'Hi!' }
```

This function takes a block and calls it twice with no parameters. Think of blocks as anonymous classes (e.g. from java) having only one method `call`.
 
Blocks are used so often in Ruby that you can write them in a more implicit way. An equivalent (and more common) way to write `twice` method defined earlier is this.

```ruby
def twice
  yield
  yield
end
```

Every time you see `yield` imagine `block.call`. That's all, no more magic.
