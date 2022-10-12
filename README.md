# kendall-square-va.github.io

This is the repository for the website owned by Kendall Square HOA in Fairfax VA 

## Understanding what this is

This repository hosts the code for a website, which is hosted at https://kendallsquarefairfax.com.
To update this code, either contact [Justin Grant](mailto:jlgrock@gmail.com) or a 
contractor that can help to edit HTML, CSS, and Ruby.  This is a Jekyll Site,
 hosted as a [GitHub Page](https://pages.github.com/) for the
[Kendall-Square-VA Group](https://github.com/Kendall-Square-VA) as this is free 
and the static nature of this means that we will never need to worry about platform 
or database attacks by hackers.  Similarly, we do not require to purchase or deal
with a 3rd party SSL certificates, as this is being managed by GitHub itself.  Basically,
this site was designed to reduce headache and maintenance.

This website posts updates to www.kendallsquarefairfax.com/feed.xml.
Any new posts will be picked up with [IFTTT](https://ifttt.com/) and the notices will
be published to the appropriate social media and google group accounts.

## Changes

Being that this account has already been set up, any minor changes should be able to be 
performed with nearly anyone with programming experience.  Significant may incur cost from shifting from this 
platform to another.  Active maintenance of this `README.md` is suggested to 
reflect any changes for future use.

To make edits, you can use [Prose](http://prose.io/), which will let you edit these files on
GitHub directly via the web browser.  Make sure to grant access to the `Kendall-Square-VA` group the first 
time it asks.

For more advanced editing, it is suggested you either use something like Sublime Text or an
IDE such as VSCode or IntelliJ to edit this code locally, as it can help you find problems
early in the process.

## Installing

[](https://www.honeybadger.io/blog/rbenv-rubygems-bundler-path/)

### Using Ruby Environment Manager and Bundler

If you are editing multiple Ruby applications, with multiple versions Ruby and gems, it makes a lot of sense
to use [Ruby Environment Manager (rbenv)](https://javierjulio.com/rbenv/).  The easiest way to accomplish this is
by using [Homebrew](https://brew.sh) and typing the command:

```bash
brew install rbenv rbenv-bundler
```

Then you can run the following command to limit all Ruby and Gem installations to local directories prior to installing
anything:

```bash
rbenv init
```

### Installing/Upgrading Ruby with Rbenv

1. List all available versions:

    `rbenv install -l`

2. Install new versions (swap 2.6.5 for your version number):

    `rbenv install 2.6.5`

3. Sets a local application-specific Ruby version by writing the version name to a `.ruby-version`
  
    `rbenv local 2.6.5`

4. Sets a shell-specific Ruby version by setting the RBENV_VERSION environment variable in your shell.

    `rbenv shell 2.2.1`

### Install Bunder and Jekyll

Installing all of the Ruby Gem dependencies for the installer is pretty easy once you have your ruby set up:

`gem install bundler jekyll`

### Updating website to latest versions (usually to fix Security Problems)

Occasionally, GitHub will tell the board that there are security vulnerabilities.  These are also
listed [here](https://github.com/Kendall-Square-VA/Kendall-Square-VA.github.io/security).
In the event that a security patch has been made, the majority of the time, you just need to update 
the fixed versions.  In many cases, GitHub will create a code change automatically, that can
be accepted [here](https://github.com/Kendall-Square-VA/Kendall-Square-VA.github.io/pulls).  In
some more complex cases, you may need to do this manually though.

Update the Ruby gemfile to the latest versions with this command

`bundle update`
 
## Key resources

This section will cover the important sections in the code and how it is organized.
In general, any folder starting with an underscore, such as `_includes`, `_layouts`, and `_posts`
will not be available in the output.

### Static Resources

For the unchanging files that you would like to be available to end-users, it is suggested 
to put them in the folder `static`.  These will be available from the website with a relative path
of `/static`.

The main groups of files are the following:
* CSS - Stylesheets for making the website look good.
* Images - The images used for the posts, as well as everything else, are in the folder `static/images`.
To add a new one, it is suggested you follow the format `static/img/[Decade]-[Name].[jpg/png/gif]`.
For example, if I want to create an image for the post on August 24, 2016, with the title 
"Just a Post", I could put it in `static/img/2016/mypic.png`.  This grouping is just to reduce overall 
clutter and allow for later cleanup.  For images not used in posts, it's suggested to put 
them at the path `static/img/`
* Files - Any other static files, like pdfs, that allow the user to open/download.

### Layouts
Defined in the `_layouts` folder, these are html files with Ruby variables that will be resolved.

There are 3 layouts
* `_layouts/default.html` - includes the page header and footer, as well as any
* `_layouts/page.html` - Extends the default template to print a title on the page
* `_layouts/post.html` - extends the default template to loop through all posts and 
creates a simple box with the image representing it and the title so that it can be clicked into

### Drafts

A place to keep posts or layouts that aren't ready for primetime.  They will not be published anywhere,
but they will live in version control.

### Posts
Defined in the `_posts` folder, this contains subfolders for each decade.  This is just to
minimize the number of files.  Each markdown file (with the extension `.md`) is a text file
following [markdown conventions](https://guides.github.com/features/mastering-markdown/).
These files should follow the naming convention of `[Decade]/[YYYY]-[MM]-[DD]-[Title(spaces replaced by dashes)].md`.  
For example, for a post on August 24, 2016, with the title "Just a Post" it should be at the location 
`2010/2016-08-24-Just-a-Post`.

As creating a post is the most common component, the following steps 
have been defined to help create a post:
1. Check out the code using [git](https://git-scm.com), or open a browser to github so 
you can add a file via the browser.
2. If there is an image you plan on using please put this into the `/static/img/` folder.
3. Create a new file in the `_posts/<decade>` folder 
with the extension ".md", which indicates this is a Markdown file.  This is a human
readable format, similar to a text file, with some simple formatting included.
4. Add the following to the top of the file: `---`
5. At this point, you can add the metadata (as shown below) to the top of your file, substituting the
correct values.  If you have any confusion on it, please feel free to open the other 
markdown files for examples.

    ```
    layout: post
    title: Board of Directors Meeting
    author: Frank Smith
    date: '2014-07-09 22:59:25 -0400'
    img: /static/img/2010/kendall_square-399x224.jpg
    categories:
    - Board Meetings
    tags: []
    published: true
    ```

6. Add the following to the next line of the file: `---`
7. Now, fill in the content that you would like to provide for an update.
8. Commit your changes to Github.


## Testing your site before you commit
Sometimes, you are doing something a little more interesting and would like to test it.  
To do this, you need to follow the 
[Jekyll Installation Instructions](https://jekyllrb.com/docs/).  At this point, you should be 
able to run the following commands:

1. Install all of the Ruby Gem dependencies for the installer

    `gem install bundler jekyll`


2. Install all of the Ruby Gem dependencies for the application

    `bundler install`
    
3. Start the server using the command below.  You will be able to access this by accessing http://127.0.0.1:4000/

    `bundle exec jekyll serve`

4. If you make any changes to the files, they will be reflected immediately.

## Updating Gemfile Dependencies
Occasionally, it is suggested that you update the dependencies so that you are not exposed to any
known security problems.  If you have a security vulnerability, it will show up 
[here](https://github.com/Kendall-Square-VA/Kendall-Square-VA.github.io/security).

Anyways, if this is the case, the most likely fix is to update your project.  This is done with the 
following command:

    `bundle lock --update`

## Additional Reading Material

### Jekyll Project Structure
https://jekyllrb.com/docs/structure/

### Jekyll Documentation
https://jekyllrb.com/docs/
