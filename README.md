# gitstats

Shell script for counting contributions on git repositories

### Prerequisites

- `git`
- `bash (>= 3.2.0)`

### Usage

See `gitstats.sh`, modify relevant info (author, home directory, start/end dates and times)

Execute by running the file:

```console
$ ./gitstats.sh
```

#### Example

Example input

```sh
author="Gihyuk Ko"              # author's name or email address
homedir="$HOME/Documents/"      # home directory
sdate="2020-03-15"              # start date in YYYY-MM-DD
edate="2020-11-15"              # end date in YYYY-MM-DD
stime="00:00:00"                # start time
etime="23:59:59"                # end time
```

Output:

```console
name: Gihyuk Ko
from: 2020-03-15 00:00:00
to: 2020-06-15 23:59:59
commits: 226
lines: 1025826
```