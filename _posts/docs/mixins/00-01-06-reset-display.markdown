---

title: reset-display
data-type: mixin
category: mixins
source-url: http://git.io/xVjedg
permalink: /redirect

---

{% highlight sass %}
reset-display()
{% endhighlight %}

Resets the active display property to `block`.

#### Usage Notes

This mixin is particularly useful when changing the display property in a single row.

#### Example

{% highlight scss %}
.element {
  @include row(table);
  // Context changed to table display
}

@include reset-display;
// Context is reset to block display
{% endhighlight %}
