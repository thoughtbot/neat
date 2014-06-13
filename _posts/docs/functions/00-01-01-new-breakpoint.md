---

title: new-breakpoint
data-type: function
category: functions
source-url: http://git.io/aSHumw
permalink: /redirect

---

{% highlight sass %}
new-breakpoint($first-feature $first-value $second-feature $second-value $total-columns)
{% endhighlight %}

Returns a media context (media query / grid context) that can be stored in a variable and passed to `media()` as a single-keyword argument. Media contexts defined using `new-breakpoint` are used by the visual grid, as long as they are defined *before* importing Neat.

{% highlight sass %}
@param $first-feature
  type: string
  default: $default-feature
{% endhighlight %}
- [Media feature](http://www.w3.org/TR/css3-mediaqueries/#media1) to use in the first query.

{% highlight sass %}
@param $first-value (required)
  type: number (positive, unit)
{% endhighlight %}
- Breakpoint value to use on the first query.

{% highlight sass %}
@param $second-feature
  type: string
{% endhighlight %}
- [Media feature](http://www.w3.org/TR/css3-mediaqueries/#media1) to use in the second query.

{% highlight sass %}
@param $second-value
  type: number (positive, unit)
{% endhighlight %}
- Breakpoint value to use on the second query.

{% highlight sass %}
@param $total-columns
  type: number (positive, unitless)
  default: $grid-columns
{% endhighlight %}
- Number of columns to use in the new grid context.

#### Shorthand syntax

{% highlight sass %}
media($first-feature $first-value [$second-feature, $second-value] [$total-columns])
{% endhighlight %}

#### Example

{% highlight scss %}
$mobile: new-breakpoint(max-width 480px 4);

.element {
  @include media($mobile) {
    @include span-columns(4);
  }
}

// CSS
@media screen and (max-width: 480px) {
  .element {
    display: block;
    float: left;
    margin-right: 7.42297%;
    width: 100%;
  }
  .element:last-child {
    margin-right: 0;
  }
}
{% endhighlight %}
