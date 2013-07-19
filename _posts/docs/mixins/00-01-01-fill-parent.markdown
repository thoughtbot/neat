---

title: Fill-parent
data-type: mixin
category: mixins
source-url: http://git.io/lYI_zA
permalink: /redirect

---

The `fill-parent()` mixin forces the element that includes it to fill its parent container. It sets its width as well as its box-sizing property (only if `$border-box-sizing` is set to false).

### Syntax

{% highlight scss %}
@include fill-parent;
{% endhighlight %}

### Example

{% highlight scss %}
.element {
  // $border-box-sizing: false;
  @include fill-parent;
}

// CSS
.element {
  width: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
{% endhighlight %}
