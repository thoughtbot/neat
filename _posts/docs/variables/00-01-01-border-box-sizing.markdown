---

title: border-box-sizing
data-type: variable
category: variables
permalink: /redirect

---

{% highlight sass %}
$border-box-sizing
  type: bool
  default: true
{% endhighlight %}

When set to `true`, it sets the box-sizing property of all elements to `border-box`.

#### Example

{% highlight scss %}
// CSS
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
{% endhighlight %}
