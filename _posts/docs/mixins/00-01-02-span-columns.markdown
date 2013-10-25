---

title: span-columns
data-type: mixin
category: mixins
source-url: http://git.io/1XyUnw
permalink: /redirect

---

{% highlight sass %}
span-columns($columns [of $container-columns], [$display])
{% endhighlight %}

Specifies the number of columns an element should span. If the selector is nested the number of columns of its parent element should be passed as an argument as well.

{% highlight sass %}
@param $columns (required)
  type: number (positive, unitless)
{% endhighlight %}
- The number of columns the element spans.

{% highlight sass %}
@param $container-columns
  type: number (positive, unitless)
  default: $grid-columns
{% endhighlight %}
- The number of columns the parent element spans.

{% highlight sass %}
@param $display
  type: string
  default: block
{% endhighlight %}
- Sets the display property of the element.
   - `block` sets the display property to `block`.
   - `block-collapse` sets the display property to `block` and removes the margin gutter.
   - `table` sets the display property to `table-cell`.

#### Example

{% highlight scss %}
.element {
  @include span-columns(6);

  .nested-element {
    @include span-columns(2 of 6);
  }
}

// CSS
.element {
  display: block;
  float: left;
  margin-right: 2.35765%;
  width: 48.82117%;
}
.element:last-child {
  margin-right: 0;
}
.element .nested-element {
  display: block;
  float: left;
  margin-right: 4.82916%;
  width: 30.11389%;
}
.element .nested-element:last-child {
  margin-right: 0;
}
{% endhighlight %}
