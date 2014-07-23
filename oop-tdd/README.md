# Object-oriented programming & Test-driven development

## Object-oriented programming

> The most difficult problem in teaching object- oriented programming is getting the learner to give up the global knowledge of control that is possible with procedural programs, and rely on the local knowledge of objects to accomplish their tasks. Novice designs are littered with regressions to global thinking: gratuitous global variables, unnecessary pointers, and inappropriate reliance on the implementation of other objects.
> 
> -- Kent Beck, Ward Cunningham: [A Laboratory For Teaching, Object-Oriented Thinking](http://c2.com/doc/oopsla89/paper.html)


> I was too blythe about the term back in the 60s and should have chosen something like "message oriented"
> 
> -- Alan Kay: [So what *did* Alan Kay really mean by the term “object-oriented”?](http://programmers.stackexchange.com/questions/46592/so-what-did-alan-kay-really-mean-by-the-term-object-oriented#comment147720_46593)


> OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things. It can be done in Smalltalk and in LISP. There are possibly other systems in which this is possible, but I'm not aware of them.
> 
> -- Alan Kay [Dr. Alan Kay on the Meaning of “Object-Oriented Programming”](http://userpage.fu-berlin.de/~ram/pub/pub_jf47ht81Ht/doc_kay_oop_en) 


> Because (in Smalltalk anyway) there is at least a setter method required, this allows the possibility of an outside setting action to be mediated by the internal method to maintain the desired interrelationships. But most people who use setters simply use them to simulate direct assignments to interior variables, and this violates the spirit and intent of real OOP.
> 
> -- Alan Kay [What did Alan Kay mean by “assignment” in The Early History of Smalltalk?](http://programmers.stackexchange.com/a/81261)


> My next question was, why on earth call it a functional language? Why not just base everything on FEXPRs and force evaluation on the receiving side when needed? I could never get a good answer, but the question was very helpful when it came time to invent Smalltalk, because this started a line of thought that said "take the hardest and most profound thing you need to do, make it great, an then build every easier thing out of it".
>
> -- Alan Kay [The Early History Of Smalltalk](http://worrydream.com/EarlyHistoryOfSmalltalk/)

---

TODO: Tasks, rules of good OOP, code, test smells


## Test-driven development

> Mock Objects is an extension to Test-Driven Development that supports good Object-Oriented design by guiding the discovery of a coherent system of types within a code base. It turns out to be less interesting as a technique for isolating tests from third-party libraries than is widely thought.
>
> -- Steve Freeman, Nat Pryce, Tim Mackinnon, Joe Walnes: [Mock Roles, not Objects](http://jmock.org/oopsla2004.pdf)


http://cumulative-hypotheses.org/2011/08/30/tdd-as-if-you-meant-it/

## Gaining broad knowledge

* **Article: [Hexagonal Architecture for Rails Developers](http://victorsavkin.com/post/42542190528/hexagonal-architecture-for-rails-developers)**  
  _by Victor Savkin_

* **Presentation: [Magic Tricks of Testing](https://speakerdeck.com/skmetz/magic-tricks-of-testing)**  
  _by Sandi Metz_

* **Book: [Ruby Science](https://learn.thoughtbot.com/products/13-ruby-science)**  
  _by thoughtbot_  


## Digging deeper 

* **Article: [Mock Roles, Not Objects](http://jmock.org/oopsla2004.pdf)**  
  _by Steve Freeman, Nat Pryce, Tim Mackinnon, Joe Walnes_

* **Video: [The Deep Synergy Between Testability and Good Design](http://vimeo.com/15007792)** _1 hour_  
  Michael Feathers (author of Working Effectively with Legacy code) talks about how tests & good design are tied together.

* **Book: [Test Driven Development: By Example](http://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530)** _240 pages_  
  _by Kent Beck_

* **Book: [Growing Object-Oriented Software, Guided by Tests](http://www.amazon.com/Growing-Object-Oriented-Software-Guided-Tests/dp/0321503627)** _384 pages_  
  _by Steve Freeman and Nat Pryce_
  
* **Video: [Integrated Tests Are A Scam](http://vimeo.com/80533536)** _1 hour_  
  _by J.B. Rainsberger_

* **Article: [Mutation testing with Mutant](http://solnic.eu/2013/01/23/mutation-testing-with-mutant.html)** _10 minutes_

* **Book: [Domain-Driven Design: Tackling Complexity in the Heart of Software](http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215)** _560 pages_  
  _by Eric Evans_

* **Book: [Patterns of Enterprise Application Architecture](http://www.amazon.com/Patterns-Enterprise-Application-Architecture-Martin/dp/0321127420)** _560 pages_  
  _by Martin Fowler_


## Tools

* Mutation testing: [mutant](https://github.com/mbj/mutant)
* Verifying doubles: [rspec-mocks](https://www.relishapp.com/rspec/rspec-mocks/docs/verifying-doubles/using-an-instance-double)
* Safe stubbing & contract testing: [bogus](https://www.relishapp.com/bogus/bogus/v/0-0-3/docs/contract-tests)
* Property-based testing: [rantly](https://github.com/hayeah/rantly)

* Static code analyzer: [rubocop](https://github.com/bbatsov/rubocop)
* Code style grammar nazi for github pull requests: [HoundCI](https://houndci.com/)

* Continuous integration: [Travis](https://travis-ci.org/)
* Continuous deployment: [Codeship](https://www.codeship.io/)

