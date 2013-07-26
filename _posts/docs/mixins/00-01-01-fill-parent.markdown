---

title: fill-parent
data-type: mixin
category: mixins
source-url: http://git.io/lYI_zA
permalink: /redirect

---

{% highlight scss %}
fill-parent()
{% endhighlight %}

Forces the element to fill its parent container.

#### Example

{% highlight scss %}
.element {
  // $border-box-sizing: false;
  @include fill-parent;
}

// CSS
.element {
  width: 100%;
  // Also sets box-sizing if global $border-box-sizing is set to 'false'
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
{% endhighlight %}
