# Interactive Graphics

R has an increasingly diverse set of tools for creating interactive
graphs. You've already seen some with  shiny and shiny gadgets. 
These tools, however, rely on running R in the background. Other
tools convert the graphs into javascript displays that can be 
embedded into web pages and html presentations. We'll see
a great version of that later for maps with leaflet. A
related approach connects R with other well developed ploting
systems that have interactivity and other nice features, like
highly novel default plotting types.

Two well developed plotting libraries are plot.ly and
Google Charts. Both have excellent tools for building, adapting
and displaying interactive graphics on the web. They also
have companion facilities for entering and manipulating the data,
such as google sheets. However, it is often the case that advanced
data analysis is being performed in R, with a desire to send final
visualizations to a Google Chart or plot.ly plot. This chapter has
those use cases in mind. The relevant R packages are `googleVis`
and `plot.ly`. In the case of `plot.ly`, the R package is created
by the company that produces the graphics program. Nonetheless,
both packages are expansive and well documented. We'll cover
`googleVis` first.

## googleVis

Watch these videos befores beginning: 
[part 1,](https://www.youtube.com/watch?v=CAtMPcSV1Qk&list=PLpl-gQkQivXjTm0HLZZaNXf1LnlFSSVX4&index=22&t=1s)
[part 2.](https://www.youtube.com/watch?v=rV9IDEE7zYY&index=23&list=PLpl-gQkQivXjTm0HLZZaNXf1LnlFSSVX4)

The basic idea of a `googleVis` chart is that one uses
R to set up their data in the format required by `googleVis`,
the `googleVis` R function creates a relevant HTML page.
The resulting HTML page has uses Google Charts javscript libraries 
and the result is an interactive HTML graphic. 

Of course, if you haven't done it already
make sure to install `googleVis` (for example by 
`install.packages("googleVis")`), which only needs to
be done once and then load it `library(googleVis)`. 
The `googleVis` package is exceptionally well documented.
In this chapter we basically go through a tour of the
manual to give users a push on some simple starting points.
After finishing the chapter, you should be able to build
on these examples to use all of the aspects of `googleVis`.

A simple example of creating a Google Chart in R
is given below. First we create a simple dataset
then plot it with a bar chart.





```r
## Create a simple data set
df = data.frame(label=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
bar = gvisBarChart(df, xvar="label", yvar=c("val1","val2"))
bar
```

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>BarChartID2fac679736bd</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<style type="text/css">
body {
  color: #444444;
  font-family: Arial,Helvetica,sans-serif;
  font-size: 75%;
  }
  a {
  color: #4D87C7;
  text-decoration: none;
}
</style>
</head>
<body>
 <!-- BarChart generated in R 3.3.2 by googleVis 0.6.2 package -->
<!-- Tue Mar 28 14:18:20 2017 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataBarChartID2fac679736bd () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"US",
1,
23
],
[
"GB",
3,
12
],
[
"BR",
4,
32
] 
];
data.addColumn('string','label');
data.addColumn('number','val1');
data.addColumn('number','val2');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartBarChartID2fac679736bd() {
var data = gvisDataBarChartID2fac679736bd();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.BarChart(
    document.getElementById('BarChartID2fac679736bd')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartBarChartID2fac679736bd);
})();
function displayChartBarChartID2fac679736bd() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartBarChartID2fac679736bd"></script>
 
<!-- divChart -->
  
<div id="BarChartID2fac679736bd" 
  style="width: 500; height: automatic;">
</div>
 <div><span>Data: data &#8226; Chart ID: <a href="Chart_BarChartID2fac679736bd.html">BarChartID2fac679736bd</a> &#8226; <a href="https://github.com/mages/googleVis">googleVis-0.6.2</a></span><br /> 
<!-- htmlFooter -->
<span> 
  R version 3.3.2 (2016-10-31) 
  &#8226; <a href="https://developers.google.com/terms/">Google Terms of Use</a> &#8226; <a href="https://google-developers.appspot.com/chart/interactive/docs/gallery/barchart">Documentation and Data Policy</a>
</span></div>
</body>
</html>

If you are viewing this book as a web page, note the
interactivity by hovering over the lines. If you
are running the code locally, you might have noticed
that calling `bar` did not create the plot, `print(bar)`
would behave similarly. Instead, these commands
print the relevant HTML for the plot. It is
shown this way as this is what is required to embed
the plot into a compiled R markdown document with
knitr. To get the results to show, use the chunk
option `results = 'asis'`. 

Perhaps the easiest way to vizalize the results is
to use the S3 plotting method associated with `googleVis` objects. 


```r
plot(Line)
```

This will create a temporary HTML file and open it up using a local server. Displaying the plot to the world will require your hosting the plot somewhere else. An
easy way to do this, as we have done for this book,
is to embed the graphics using knitr then hosting your
knitr document as you usually do. Alternatively, you
can grab the code for the graphic and embed it into
any hosted web page that you create. The developers
anticipated this use case and hence
the various utilities for printing out the HTML and javascript. Most usefully, 
the `print` method associated with `googleVis`
objects will prints out the code with various amounts
of HTML preamble. `?print.gvis` shows the options.

The `googleVis` package has several plotting functions. Some of the main
ones include:

* Motion charts:  `gvisMotionChart`
* Interactive maps: `gvisGeoChart`
* Interactive tables: `gvisTable`
* Line charts: `gvisLineChart`
* Bar charts: `gvisColumnChart`
* Tree maps: `gvisTreeMap`

The full documentation can be found [here](http://cran.r-project.org/web/packages/googleVis/googleVis.pdf). We'll cover
a few examples and from those you should easily be able to generalize to the
others covered in the package.

A geoChart is an interactive map. Thus `googleVis` can match much of the
functionality of `leaflet`. Consider this plot of the `Exports` dataset.
First, look at the data.


```r
head(Exports)
```

```
##         Country Profit Online
## 1       Germany      3   TRUE
## 2        Brazil      4  FALSE
## 3 United States      5   TRUE
## 4        France      4   TRUE
## 5       Hungary      3  FALSE
## 6         India      2   TRUE
```


```r
G = gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit",options=list(width=600, height=400))
print(G,"chart")
```

<!-- GeoChart generated in R 3.3.2 by googleVis 0.6.2 package -->
<!-- Tue Mar 28 13:59:46 2017 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID8d43aa243fe () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Germany",
3
],
[
"Brazil",
4
],
[
"United States",
5
],
[
"France",
4
],
[
"Hungary",
3
],
[
"India",
2
],
[
"Iceland",
1
],
[
"Norway",
4
],
[
"Spain",
5
],
[
"Turkey",
1
] 
];
data.addColumn('string','Country');
data.addColumn('number','Profit');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID8d43aa243fe() {
var data = gvisDataGeoChartID8d43aa243fe();
var options = {};
options["width"] = 600;
options["height"] = 400;

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID8d43aa243fe')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID8d43aa243fe);
})();
function displayChartGeoChartID8d43aa243fe() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID8d43aa243fe"></script>
 
<!-- divChart -->
  
<div id="GeoChartID8d43aa243fe" 
  style="width: 600; height: 400;">
</div>

Options in a `googleVis` chart are given in a list format.
These are well documented in the help manual for each function.
The parameters have to be set to the named value in Google
Charts documentation for the associated chart. For example,
consider the `gvisGeoChart` function. It's options can be
found [here](https://developers.google.com/chart/interactive/docs/gallery/geochart#Configuration_Options). 

For example, you can zoom the plot in on a specific region by specifying
`region=` in the options list. Consider focusing the map
on Europe. The region codes are given [here](https://developers.google.com/chart/interactive/docs/gallery/geochart#Continent_Hierarchy).


```r
G2 = gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit",options=list(width=600, height=400,region="150"))
print(G2,"chart")
```

<!-- GeoChart generated in R 3.3.2 by googleVis 0.6.2 package -->
<!-- Tue Mar 28 14:18:20 2017 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID2fac412c5d7d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Germany",
3
],
[
"Brazil",
4
],
[
"United States",
5
],
[
"France",
4
],
[
"Hungary",
3
],
[
"India",
2
],
[
"Iceland",
1
],
[
"Norway",
4
],
[
"Spain",
5
],
[
"Turkey",
1
] 
];
data.addColumn('string','Country');
data.addColumn('number','Profit');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID2fac412c5d7d() {
var data = gvisDataGeoChartID2fac412c5d7d();
var options = {};
options["width"] = 600;
options["height"] = 400;
options["region"] = "150";

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID2fac412c5d7d')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID2fac412c5d7d);
})();
function displayChartGeoChartID2fac412c5d7d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID2fac412c5d7d"></script>
 
<!-- divChart -->
  
<div id="GeoChartID2fac412c5d7d" 
  style="width: 600; height: 400;">
</div>

