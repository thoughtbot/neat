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

Sets the width of an element to that of the number of columns it spans. The width is percentage-based and depends on the display property passed to the mixin. If the selector is nested the number of columns of its parent element should be passed as an argument as well.

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
   - `block` sets the display property to `block` and calculates the width based on a block layout.
   - `block-collapse` behaves like `block` but removes margin gutters.
   - `table` sets the display property to `table-cell` and calculates the width based on a table layout.
   - `no-display` calculates the width based on block layout without setting the display property.

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
