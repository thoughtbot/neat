---

title: reset-all
data-type: mixin
category: mixins
source-url: http://git.io/xVjedg
permalink: /redirect

---

{% highlight sass %}
reset-all()
{% endhighlight %}

Resets both the active layout direction and the active display property.

#### Syntax

{% highlight scss %}
.element {
  @include row(table, RTL);
  // Context changed to table table and right-to-left
}

@include reset-all;
  // Context is reset to block display and left-to-right
{% endhighlight %}

