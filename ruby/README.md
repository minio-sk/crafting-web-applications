Learning Ruby
=============

_**Task:** Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build)._

_**Task:** Install Ruby 2.1.2 using `rbenv install 2.1.2` command._

_**Task:** Install [Rubymine IDE](http://www.jetbrains.com/ruby/)._
 
_**Task:** Download and extract [Ruby Koans](http://rubykoans.com/)._
 
_**Task:** Open Ruby Koans in Rubymine, run `path_to_enlightenment.rb` and follow the instructions. This normally takes several hours._

NOTE: When possible do this in pairs (pair programming, one computer, two people). If one from the pair is more experienced, as a rule of thumb for learning, the other one should be using the keyboard. This way the experienced one is learning to explain better and the other one learns faster by doing more. 

NOTE: Consider switching pairs in fixed time intervals (20-30minutes), so people start to know each other better and solve blocking tasks, other pairs already solved. 

---

Expression problem
------------------

```ruby
class Number < Struct.new(:value)
  def print
    value
  end
end

class Binary < Struct.new(:left, :right)
end

class Plus < Binary
  def print
    "(#{left.print} + #{right.print})"
  end
end

class Times < Binary
  def print
    "(#{left.print} * #{right.print})"
  end
end
```

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Number.new(5))
)

puts expression.print
# => (1 + (2 * 5))
```

Adding a new datatype

```ruby
class Negation < Struct.new(:expression)
  def print
    "-#{expression.print}"
  end
end
```

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Negation.new(Number.new(5)))
)

puts expression.print
# => (1 + (2 * -5))
```

Adding a new operation

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

```ruby
expression = Plus.new(
  Number.new(1),
  Times.new(Number.new(2), Negation.new(Number.new(5)))
)

puts expression.eval
# => -9
```


Gaining broad knowledge
-----------------------

* [Ruby Documentation](http://www.ruby-doc.org/)



Going deeper
------------




Frequently Asked Questions
--------------------------

Blocks
------

```ruby
(5) do 
```


```ruby
def double_it(array, &block)
end
```
