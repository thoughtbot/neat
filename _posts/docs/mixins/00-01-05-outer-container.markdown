---

title: Outer-container
data-type: mixin
category: mixins
source-url: http://git.io/oRDhOg
permalink: /redirect

---

The `outer-container()` mixin can be called on the outer-most element in the grid hierarchy, often referred to as the *wrapper*. It centers the element, sets its `max-width`, and clears its floats.

Although optional, using `outer-container` is recommended. The mixin can be called on more than one element per page.

### Syntax

{% highlight scss %}
@include outer-container;
{% endhighlight %}

### Example

{% highlight scss %}
.element {
  @include outer-container;
}

// CSS
.element {
  *zoom: 1;
  max-width: 68em;
  margin-left: auto;
  margin-right: auto;
}
.element:before, .element:after {
  content: " ";
  display: table;
}
.element:after {
  clear: both;
}
{% endhighlight %}
