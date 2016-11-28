---

title: flex-gutter
data-type: function
category: functions
source-url:
https://github.com/thoughtbot/neat/blob/272c70958e9f1f4d0a2d95a49780f3d310ffe8d4/app/assets/stylesheets/grid/_private.scss#L14
permalink: /redirect

---

{% highlight sass %}
flex-gutter($columns, $container-columns)
{% endhighlight %}

Calculates the relative width of the gutter based on `$column` and `$gutter`
(see Variables section).

{% highlight sass %}
@param $columns
  type: number (positive, unitless)
  default: 1
{% endhighlight %}
- The number of columns the element spans.

{% highlight sass %}
@param $container-columns
  type: number (positive, unitless)
  default: 12
{% endhighlight %}
- The number of columns the parent element spans.

### Example

{% highlight scss %}
div {
  width: flex-grid(4);        // returns (315px / 1020px) = 30.882353%;
  margin-left: flex-gutter(); // returns (25px / 1020px) = 2.45098%;

  p {
    width: flex-grid(2, 4);   // returns (145px / 315px) = 46.031746%;
    float: left;
    margin: flex-gutter(4);   // returns (25px / 315px) = 7.936508%;
  }

  blockquote {
    float: left;
    width: flex-grid(2, 4);   // returns (145px / 315px) = 46.031746%;
  }
}
{% endhighlight %}
