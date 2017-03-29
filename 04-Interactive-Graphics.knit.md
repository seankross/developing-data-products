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
then plot it with a bar chart. Let's create a 
dataset with the Coursera Data Science Specialization
instructors' info (note most of this is fake, since I
don't actually know Jeff or Roger's ages.)
















