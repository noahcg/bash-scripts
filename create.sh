echo "Enter directory name"
read dirname

if [ ! -d "$dirname" ]
then
    echo "File doesn't exist. Creating now"
    mkdir -p ./$dirname/{css,images,js,jade,sass}
    touch ./$dirname/jade/index.jade
    touch ./$dirname/sass/style.scss
    touch ./$dirname/sass/_reset.scss
    touch ./$dirname/js/script.js
    touch ./$dirname/config.rb

# add contents to config.rb file
cat <<EOM>> ./$dirname/config.rb
# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "/css"
sass_dir = "/css/sass"
images_dir = "images"
javascripts_dir = "js"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

end
EOM

# add contents to index.jade file
cat <<EOM>> ./$dirname/jade/index.jade
doctype html
//if lt IE 7
  html.no-js.lt-ie9.lt-ie8.lt-ie7(dir='ltr', lang='en')
//if IE 7
  html.no-js.lt-ie9.lt-ie8(dir='ltr', lang='en')
//if IE 8
  html.no-js.lt-ie9(dir='ltr', lang='en')
// [if gt IE 8] <!
html.no-js.gt-ie8(dir='ltr', lang='en')
  // <![endif]
  head
    meta(charset='utf-8')
    meta(http-equiv='X-UA-Compatible', content='IE=edge,chrome=1')
    title Project Title
    meta(name='viewport', content='width=device-width,initial-scale=1')
    script(src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js')
    script(src='js/script.js')
    link(rel='stylesheet', href='css/style.css')    
  body
EOM

# import reset into main sass file
cat <<EOM>> ./$dirname/sass/style.scss
@import "_reset";
EOM

# add contents to reset.scss file
cat <<EOM>> ./$dirname/sass/_reset.scss
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video, picture {
  margin: 0;
  padding: 0;
  border: 0;
  font-family: Arial, sans-serif;
  font-size: 100%;
  vertical-align: baseline; }

/* HTML5 display-role reset for older browsers */

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
  display: block; }

body {
  line-height: 1;
}

ol, ul {
  list-style: none; }

blockquote, q {
  quotes: none; }

blockquote {
  &:before, &:after {
    content: '';
    content: none; } }

q {
  &:before, &:after {
    content: '';
    content: none; } }

table {
  border-collapse: collapse;
  border-spacing: 0; }

*{
  box-sizing: border-box;
}

EOM
    echo "File created"
else
    echo "File exists"
fi