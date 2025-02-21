## Learning Express Js

in nodejs 18 and above auto rerun feature is build in. need to run the script in following way

```bsh
node --watch index.js
```
this will keep running the index.js whenever there is any changes only in index.js and index.js runs without throwing any error.
to rerun the script whenever any file in a directory changes, run the script with the following command

```bsh
node --watch-path=src index.js
```
the command watch changes in src directory,and if there is any change then it rerun the index.js utill index.js
runs without throwing any error. i can watch multiple path just by adding more '--watch-path=/path/to/other/directory'. before node 18 it is achived via nodemon package; but node 18 onwards this feature is builtin. so, no need for nodemon anymore.

### Projects:

1. [**EventManager**](/eventmanager/ReadMe.md)