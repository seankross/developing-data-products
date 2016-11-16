# R Markdown

[Watch this video before beginning.]()

## Introduction to Markdown

Markdown is a lightweight markup language which emphasizes ease of writing and 
reading content and can easily be converted into HTML. Markdown was invented
by [John Gruber](https://en.wikipedia.org/wiki/John_Gruber) with significant
contributions from [Aaron Swartz](https://en.wikipedia.org/wiki/Aaron_Swartz).
R Markdown extends markdown to include R code results including tables and
visualizations. The `rmarkdown` package can create web pages, PDFs, and slide
presentations from R Markdown documents. The real power of R Markdown is the
ability to intertwine natural language and code. This approach is known as
[literate programming](https://en.wikipedia.org/wiki/Literate_programming).

## Basic Markdown Syntax

Below are a few examples of Markdown's syntax. You can find a comprehensive
syntax guide on [RStudio's website](http://rmarkdown.rstudio.com/authoring_basics.html).

#### Headers

```
# I'm huge!
## I'm still large
### I'm a reasonable size
```

#### Prose

```
It was the best of times, it was the worst of times, it was the age of wisdom, 
it was the age of foolishness, it was the epoch of belief, it was the epoch of 
incredulity, it was the season of Light, it was the season of Darkness, it was 
the spring of hope, it was the winter of despair, we had everything before us, 
we had nothing before us, we were all going direct to Heaven, we were all going 
direct the other way – in short, the period was so far like the present period, 
that some of its noisiest authorities insisted on its being received, for good 
or for evil, in the superlative degree of comparison only.
```

#### Bold and italic

```
*italic*

**bold**

***bold and italic***
```

#### Lists

Unordered:

```
- an item
- another item
- a third item
```

Ordered:

```
1. an item
2. another item
3. a third item
```

#### Links

```
[JHU's Homepage](http://www.jhu.edu)
```

#### Images

```
![A seagull](https://farm9.staticflickr.com/8221/8259009216_4b4e6f994c_m.jpg)
```

#### Quoted Text

```
> Good night, Mrs. Calabash, wherever you are.
```

#### Code

```
# Code from Hadley Wickham's purr package

reduce <- function(.x, .f, ..., .init) {
  .f <- as_function(.f, ...)

  f <- function(x, y) {
    .f(x, y, ...)
  }

  Reduce(f, .x, init = .init)
}
```

#### Inline Code

```
You can use the `c()` function to make vectors.
```

## Putting the R in R Markdown

If you want to insert R code into an R Markdown document you can use the
following syntax:

    ```{r}
    # Write some R code here!
    x <- rnorm(10)
    x^2
    plot(x)
    ```

The results of computing `x^2` and the graph produced by `plot(x)` will both
be displayed under this chunk of R code once you render this R Markdown file
into a web page, a PDF, or a presentation. There are several options that are
useful for customizing these R code chunks which we'll discuss in a later
section.

## Writing and Rendering Documents

Open up a new file in a plain text editor and have your R console ready. I 
highly recommend using [RStudio](https://www.rstudio.com/products/rstudio/download2/)
since it nicely combines a plain text editor, an R console, and a file browser.
Write some markdown in your plain text editor, or copy and paste the R Markdown
below:

    ---
    title: "Simulation in R"
    author: Brian Caffo
    date: July 28, 2016
    ---

    ## Simple Simulation in R

    Welcome to my tutorial on doing very simple simulations in R. The first
    simulation we're going to try is flipping a coin, which can result in the
    the coin landing heads up or tails up. We can simulate flipping one coin by
    running the `flip_one_coin()` function defined below:

    ```{r}
    flip_one_coin <- function(){
      sample(c("H", "T"), 1)
    }
    ```

    ## Simulation 1

    Let's test the simple result of performing one coin flip:

    ```{r}
    flip_one_coin()
    ```

    ## Flip Many Coins

    Instead of flipping one coin at a time, we can define a function that will flip
    a specified number of coins:

    ```{r}
    flip_coins <- function(n){
      sample(c("H", "T"), n, replace = TRUE)
    }
    ```

    ## Coin Filling Results

    Let's take a look at the results of flipping 100 coins with a bar graph:

    ```{r}
    barplot(table(flip_coins(100)))
    ```

One feature of R Markdown that is different from regular Markdown is the 
presence of yaml front matter at the beginning of the file. 
[Yaml](http://yaml.org/) is a simple medium for providing metadata about the
document that you're writing. The yaml front matter is written in-between a pair
of three hyphens (`---`) at the beginning of the document. In the Rmd file above
I've specified a title, author, and date for this document which will be
placed at the beginning of the document.

Save your R Markdown document in your current working directory as 
`simple_sim.Rmd`. In order to render this document into a webpage first
install the `rmarkdown` package if you haven't already with 
`install.packages("ramrkdown")`. Once the package is installed you can load the
`rmarkdown` package with `library(rmarkdown)`. You can then render your R
Mardown into a webpage by entering `render("simple_sim.Rmd")` into the R
console. After the HTML document has been produced you can view your new
document by entering `browseURL("simple_sim.html")` into the R console.
Congratulations on creating your first data product!

If you want to create a PDF instead of an HTML document you need to provide
different arguments to the `render()` function. Enter 
`render("simple_sim.Rmd", output_format = pdf_document())` into the R console in
order to create a PDF.

There are several advantages and disadvantages between distributing HTML or PDF
documents. HTML allows your data product to be distributed as a website which
allows you to embed interactive visualizations, some of which will we talk about
creating in a later chapter. PDF documents are more self-contained compared to
HTML, although they are static documents - they're not responsive like a webpage
can be. In general, if you want others to build upon your data product

## Creating Presentations in R Markdown

In addition to creating webpages and PDFs from R Markdown, you can also create
slide presentations. Use the R Markdown document from the previous section and
enter `render("simple_sim.Rmd", output_format = ioslides_presentation())` into 
the R console. Now open up the slide deck with `browseURL("simple_sim.html")`.
As you can see this is still a webpage, except your document has been rendered
as a slide deck!

Each slide is demarcated in your R markdown file with two pound signs `##`
followed by the title of the slide. The fields specified in the yaml front matter
create the first slide. If you'd rather produce PDF slides, you can enter
`render("simple_sim.Rmd", output_format = beamer_presentation())` into the R
console in order to create PDF slides with the LaTeX 
[Beamer](https://en.wikipedia.org/wiki/Beamer_(LaTeX)) framework.

## Sharing R Markdown Documents

We recommend the following websites for sharing the HTML files that you produce
from R Markdown documents. If you've taken The Data Scientist's Toolbox then 
you should be familiar with [GitHub Pages](https://pages.github.com/). 
If you're familiar with Git and you haven't used it before their documentation
for creating a site is very straightforward. If you're not familiar with Git 
and you're using RStudio you should take advantage of 
[RPubs](http://rpubs.com/), which is perhaps the easiest way to share an HTML 
document from RStudio. You can find simple instructions for using RPubs
[here](http://rpubs.com/about/getting-started). If you're looking for a site 
that will host any HTML file for free, including HTML files that are generated 
by R Markdown, you should check out [NeoCities](https://neocities.org/).

## Closing Thoughts

With R Markdown you can intertwine code from many programming languages,
including R, with prose, tables, and graphics. From the source of one Rmd file
you can produce several different kinds of data products including websites, 
PDFs, and even ebooks. For more information about R Markdown we encourage you to
visit http://rmarkdown.rstudio.com/.
