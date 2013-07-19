---

title: Default-feature
data-type: variable
category: variables
permalink: /redirect

---

The `$default-feature` variable sets the default media feature that `media()` and `new-breakpoint()` revert to when only a breakpoint value is passed.

### Syntax

{% highlight scss %}
$default-feature: max-width;
{% endhighlight %}

- *Values >* **string** : any valid [media feature](http://www.w3.org/TR/css3-mediaqueries/#media).
- *Default >* `min-width` (mobile-first)
