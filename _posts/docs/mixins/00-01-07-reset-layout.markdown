---

title: reset-layout
data-type: mixin
category: mixins
source-url: http://git.io/xVjedg
permalink: /redirect

---

{% highlight sass %}
reset-layout-direction()
{% endhighlight %}

Resets the active layout direction to the default value set in `$default-layout-direction`.

#### Usage Notes

This mixin is particularly useful when changing the layout direction in a single row.

#### Example

{% highlight scss %}
.element {
  @include row($direction: RTL);
  // Context changed to right-to-left
}

@include reset-layout-direction;
// Context is reset to left-to-right
{% endhighlight %}
