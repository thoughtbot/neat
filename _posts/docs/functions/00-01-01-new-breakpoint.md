---

title: New-breakpoint
data-type: function
category: functions
source-url: http://git.io/aSHumw
permalink: /redirect

---

The `media()` functions returns a media context (media query / grid context) that can be stored in a variable and passed to `media()` as a single-keyword argument. Media contexts defined using `new-breakpoint` are used by the visual grid, as long as they are defined _before_ importing Neat.

### Syntax

{% highlight scss %}
$variable-name: new-breakpoint($first-media-feature $first-breakpoint-value $second-media-feature $second-breakpoint-value $total-columns);
{% endhighlight %}

#### Arguments

- `$first-breakpoint-value` **number** *positive, unit* : Breakpoint value to use on the first query.

#### Optional Arguments

- `$first-media-feature` **string** : Media feature to use in the first query.
- *Default >* `$default-feature`
- *Values >* any valid [media feature](http://www.w3.org/TR/css3-mediaqueries/#media1).

- `$second-breakpoint-value` **number** *positive, unit* : Breakpoint value to use on the optional second query.

- `$first-media-feature` **string** : Media feature to use in the optional second query. Becomes required when the `$second-breakpoint-value` is passed.
- *Default >* *null*
- *Values >* any valid [media feature](http://www.w3.org/TR/css3-mediaqueries/#media1).

*   `$total-columns` **number** _positive, unitless_ : Number of columns to use in the new grid context.

*   _Default >_ `$grid-columns`

### Example

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
