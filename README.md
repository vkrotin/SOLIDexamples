# SOLIDexamples
App demonstrate SOLID principles in iOS on Swift language

<img align="center" src="https://github.com/vkrotin/SOLIDexamples/blob/main/ExampleSOLID/Images/SOLID.png?raw=true">

### Single responsibility principle

The single responsibility principle is a computer programming principle that states that every module, class, or function should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class. All its services should be narrowly aligned with that responsibility.

* Обозначает, что  каждый объект должен иметь одну обязанность и эта обязанность должна быть полностью инкапсулирована в класс. Все его сервисы должны быть направлены исключительно на обеспечение этой обязанности.
--------
### Open-close principle

Modules/Classes/entities should be open for extension but closed for modification. (to some extent)

* Программные сущности (классы, модули, функции и т. п.) должны быть открыты для расширения, но закрыты для изменения. Это означает, что эти сущности могут менять свое поведение без изменения их исходного кода
--------
### Liskov substitution principle

Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.

* Функции, которые используют базовый тип, должны иметь возможность использовать подтипы базового типа не зная об этом
--------
### Interface segregation principle

Many client-specific interfaces are better than one general-purpose interface

* В формулировке Роберта Мартина: «клиенты не должны зависеть от методов, которые они не используют». Принцип разделения интерфейсов говорит о том, что слишком «толстые» интерфейсы необходимо разделять на более маленькие и специфические, чтобы клиенты маленьких интерфейсов знали только о методах, которые необходимы им в работе. В итоге, при изменении метода интерфейса не должны меняться клиенты, которые этот метод не используют.
--------
### Dependency inversion principle 

One should “depend upon abstractions, [not] concretions. OR (Program to an interface ) OR (Abstractions should never depend upon details. Details should depend upon abstractions.)

* модули верхних уровней не должны зависеть от модулей нижних уровней, а оба типа модулей должны зависеть от абстракций; сами абстракции не должны зависеть от деталей, а вот детали должны зависеть от абстракций.
--------
