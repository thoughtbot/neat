---

title: Border-box-sizing
data-type: variable
category: variables
permalink: /redirect

---

The `$border-box-sizing` variable sets the box-sizing property of the all elements to `border-box`.

### Syntax

{% highlight scss %}
$border-box-sizing: false;
{% endhighlight %}

- *Value >* **bool** : `false` to disable the `border-box` layout.
- *Default >* `true`

### Example ###

{% highlight scss %}
// CSS
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
{% endhighlight %}
