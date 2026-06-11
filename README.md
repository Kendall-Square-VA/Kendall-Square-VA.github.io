# kendall-square-va.github.io

This is the repository for the website owned by Kendall Square HOA in Fairfax VA.

## Understanding what this is

This repository hosts the code for a website at https://kendallsquarefairfax.com.
To update this code, either contact [Justin Grant](mailto:jlgrock@gmail.com) or a
contractor who can help edit HTML, CSS, and Ruby. This is a Jekyll site hosted as a
[GitHub Page](https://pages.github.com/) for the
[Kendall-Square-VA Group](https://github.com/Kendall-Square-VA). Hosting is free,
the static nature means no platform or database attacks, and SSL certificates are
managed by GitHub — designed to minimize headache and maintenance.

This website posts updates to www.kendallsquarefairfax.com/feed.xml.
New posts are picked up by [IFTTT](https://ifttt.com/) and published to the
appropriate social media and Google Groups accounts.

## Changes and the PR workflow

All changes to `main` must go through a **pull request**. Direct pushes are blocked.
Every PR must pass four required CI checks before it can be merged:

| Check | What it validates |
|---|---|
| `build-and-audit` | Site builds cleanly and no known gem CVEs |
| `content-lint` | Every post has required front matter fields and a valid publish date |
| `link-check` | No broken internal links in the generated site |
| `smoke-e2e` | Key pages load and navigation links are present |

Minor changes can be made via [Prose](http://prose.io/) (GitHub web editor).
For more advanced editing, use VS Code or IntelliJ to work locally.

## Installing the toolchain

The project requires **Ruby 3.3**, **Bundler 4+**, and **Node (LTS)**.

### 1. Ruby via Homebrew

```bash
brew install ruby@3.3
```

Add Ruby 3.3 to your shell PATH. Add the following line to `~/.zshrc` (or `~/.bash_profile` for bash) and then open a new terminal:

```bash
export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"
```

Verify:

```bash
ruby --version    # should print 3.3.x
bundle --version  # should print Bundler 4.x
```

### 2. Node via Homebrew

```bash
brew install node
```

Verify:

```bash
node --version  # should print v20 or higher
npm --version
```

### 3. Install all dependencies

Run both of these from the repository root. Only needs to be done once (and after any `bundle update` or `npm update`):

```bash
bundle install          # installs Ruby gems
npm install             # installs Node packages and creates/updates package-lock.json
npm run install-browsers  # downloads the Playwright Chromium browser for smoke tests
```

## Security updates

Security vulnerabilities are listed [here](https://github.com/Kendall-Square-VA/Kendall-Square-VA.github.io/security).

**Most updates are handled automatically.** Dependabot runs every Monday and opens a pull
request for any outdated gems. Patch and minor version updates are auto-approved and
set to auto-merge once CI passes. Major version updates require a manual review.

To update dependencies manually:

```bash
bundle update
```

To check for known CVEs locally (install `bundler-audit` once if it is not already available):

```bash
gem install bundler-audit --no-document
bundler-audit update && bundler-audit check .
```
 
## Key resources

Any folder starting with an underscore (`_includes`, `_layouts`, `_posts`) is not
included in the generated site output.

### Static Resources

Unchanging files that should be publicly accessible go in `static/`, available at `/static`:

* **CSS** — stylesheets in `static/css/`.
* **Images** — in `static/img/`. Suggested path: `static/img/[Decade]/[name].[jpg|png|gif]`.
  Example: `static/img/2016/mypic.png`.
* **Files** — any other static assets (PDFs, etc.) in `static/files/`.

### Layouts

Defined in `_layouts/`. HTML files with Liquid template variables.

* `_layouts/default.html` — includes page header and footer.
* `_layouts/page.html` — extends default, adds a page title.
* `_layouts/post.html` — extends default; displays the post title, publish date, optional
  event date (when different from the publish date), and post content.

### Drafts

Posts or layouts that aren’t ready for publication. They won’t be deployed but are kept
in version control.

### Posts

Defined in `_posts/`, in decade-based subfolders to limit file count per directory.
Each Markdown file (`.md`) must follow the naming convention:

```
_posts/[decade]/[YYYY]-[MM]-[DD]-[title-with-dashes].md
```

**Important — post dates vs event dates:**
The filename date (`YYYY-MM-DD`) represents the **event date** — the date of the meeting,
party, or other happening. The `date` field in the front matter is the **publish/announcement date**
— the date the post was written and made public, which may be earlier than the event.
The post layout automatically surfaces the event date when it differs from the publish date.

To create a new post:

1. Check out the code with git (or use the GitHub web editor).
2. If you have an image, put it in `static/img/<decade>/`.
3. Create a new `.md` file in `_posts/<decade>/` named after the **event date and title**:
   ```
   _posts/2010/2016-08-24-just-a-post.md
   ```
4. Add the following front matter block at the top of the file:
   ```yaml
   ---
   layout: post
   title: Board of Directors Meeting
   author: Frank Smith
   date: '2016-08-10 09:00:00 -0400'
   img: /static/img/2010/kendall_square-399x224.jpg
   categories:
     - Board Meetings
   tags: []
   published: true
   ---
   ```
   > `date` is the **announcement date** (when you write the post). The filename date is the **event date**.
5. Add your content below the closing `---`.
6. Commit your changes and open a pull request. CI checks must pass before merging.

## Running the site locally

```bash
bundle exec jekyll serve
```

Access the site at http://127.0.0.1:4000/. Changes to most files are reflected immediately without restarting the server.

## Running the test suite locally

All four CI checks mirror what runs on every pull request. Run them in order:

### 1. Front matter validation

Checks every post has the required `layout`, `title`, and `date` fields, and that the publish date is not after the event date:

```bash
ruby scripts/validate_posts.rb
```

### 2. Build the site

Must be run before the link check and smoke tests:

```bash
bundle exec jekyll build
```

### 3. Internal link check

Scans the generated `_site/` for broken internal links:

```bash
bundle exec htmlproofer ./_site \
  --checks Links \
  --disable-external \
  --allow-hash-href \
  --allow-missing-href \
  --no-enforce-https
```

### 4. Smoke E2E tests

Starts a local HTTP server over the built site, runs Playwright tests against it, then shuts the server down:

```bash
python3 -m http.server 4000 --directory _site &
SERVER_PID=$!
BASE_URL=http://127.0.0.1:4000 npm test
kill $SERVER_PID
```

> **Prerequisite:** make sure you have run `npm install` and `npm run install-browsers` at least once after cloning.

### 5. Security audit

```bash
bundler-audit update && bundler-audit check .
```

> If `bundler-audit` is not found, install it first: `gem install bundler-audit --no-document`

## Additional reading

- [Jekyll project structure](https://jekyllrb.com/docs/structure/)
- [Jekyll documentation](https://jekyllrb.com/docs/)
- [Markdown conventions](https://guides.github.com/features/mastering-markdown/)
