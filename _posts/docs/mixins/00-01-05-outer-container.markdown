---

title: outer-container
data-type: mixin
category: mixins
source-url: http://git.io/oRDhOg
permalink: /redirect

---

{% highlight sass %}
outer-container()
{% endhighlight %}

Centers the element in the viewport, clears its floats, and sets its `max-width`.

#### Usage Notes

Although optional, using `outer-container` is recommended. The mixin can be called on more than one element per page, as long as they are not nested.

#### Example

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
