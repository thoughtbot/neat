---

title: grid-width
data-type: function
category: functions
source-url: https://github.com/thoughtbot/neat/blob/272c70958e9f1f4d0a2d95a49780f3d310ffe8d4/app/assets/stylesheets/grid/_private.scss#L19
permalink: /redirect

---

{% highlight sass %}
grid-width($columns)
{% endhighlight %}

Easily setup for a fixed grid based design.

{% highlight sass %}
@param $columns
  type: number (positive, unitless)
  default: 1
{% endhighlight %}
- The number of columns the element spans.

### Example

{% highlight scss %}
$gw-column: 100px;          // Column Width
$gw-gutter: 40px;           // Gutter Width

div {
  width: grid-width(4);     // returns 520px;
  margin-left: $gw-gutter;  // returns 40px;
}
{% endhighlight %}
