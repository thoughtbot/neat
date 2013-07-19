---

title: Span-columns
data-type: mixin
category: mixins
source-url: http://git.io/1XyUnw
permalink: /redirect

---

The `span-columns()` mixin specifies the number of columns an element should span. If the selector is nested (its parent is not the top-most container) the number of columns of its parent element should be passed as an argument as well.

### Syntax

{% highlight scss %}
@include span-columns($columns of $container-columns, $display)
{% endhighlight %}

#### Arguments

- `$columns` **number** *positive, unitless* : The number of columns the element would span.

#### Optional Arguments

- `of $container-columns` **number** *positive, unitless* : The number of columns the parent element spans.
  - *Default >* `$grid-columns`

 - `$display` **string** :  Sets the display property of the element.
   - **`block`** sets the display property to `block`.
   - `collapse` sets the display property to `block` and removes the margin gutter.
   - `table` sets the display property to `table-cell` where margin gutters are not applicable.

### Example

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
