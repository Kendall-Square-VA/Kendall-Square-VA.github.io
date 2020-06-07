# kendall-square-va.github.io

This is the repository for the website owned by Kendall Square HOA in Fairfax VA 

## How to create a post
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
    author: Cordell Ratner
    date: '2014-07-09 22:59:25 -0400'
    img: /static/img/2010/kendall_square-399x224.jpg
    categories:
    - Board Meetings
    tags: []
    ```

6. Add the following to the next line of the file: `---`
7. Now, fill in the content that you would like to provide for an update.
8. Commit your changes to Github.

## Testing your site before you commit
Sometimes, you are doing something a little more interesting and would like to test it.  
To do this, you need to follow the 
[Jekyll Installation Instructions](https://jekyllrb.com/docs/).  At this point, you should be 
able to run the following commands:

1. Install all of the Ruby Gem dependencies

    `gem install bundler jekyll`

2. Start the server.  If you make any changes to the files, they will be reflected immediately. 
    `bundle exec jekyll serve`

## Additional Reading Material

### Jekyll Project Structure
https://jekyllrb.com/docs/structure/

### Jekyll Documentation
https://jekyllrb.com/docs/
