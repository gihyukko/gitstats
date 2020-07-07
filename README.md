# gitstats

Shell script for counting contributions on git repositories

### Prerequisites

- `git`
- `bash (>= 3.2.0)`

### Usage

- Make sure to update all repos to the latest commits before running this script

- Modify line 12-17 of `gitstats.sh` using your favorite text editor, input relevant information
    - `NAME`: your name or email used for authoring git
    - `HOME`: top-most directory where your git repo is contained (please avoid using directories where you do not have execute access)
    - `SDATE`/`EDATE`: start and end date in _YYYY-MM-DD_
    - `STIME`/`ETIME`: start and end time in _HH:MM:SS_

- Execute by running the following:

```console
$ ./gitstats.sh
```

#### Example

Example input

```sh
author="Gihyuk Ko"              # author's name or email address
homedir="$HOME/Documents/"      # home directory
sdate="2020-03-15"              # start date in YYYY-MM-DD
edate="2020-06-15"              # end date in YYYY-MM-DD
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

### TODOs
- error msgs