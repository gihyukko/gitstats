# gitstats

Shell script for counting contributions in git repositories

### Prerequisites

- `git`
- `bash (>= 3.2.0)`

### Usage

- Make sure to update all git repos to the latest commits before running this script

- Modify [**line 12-17**](gitstats.sh#L12-L17) of `gitstats.sh` using your favorite text editor, fill in the following:
    - `NAME`: your name or email used for authoring git
    - `HOME`: top-most directory where your git repo is contained (please avoid using directories where you do not have execute access)
    - `SDATE`/`EDATE`: start and end date in _yyyy-mm-dd_
    - `STIME`/`ETIME`: start and end time in _HH:MM:SS_

- Execute the script:

```console
$ ./gitstats.sh
```

- The script automatically searches all git repos under given directory (`HOME`), counts contributions (number of commits and lines modified) made by the author (`NAME`) between specific period (from `SDATE STIME` to `EDATE ETIME`)

#### Example

Example input

```sh
author="Gihyuk Ko"              # author's name or email address
homedir="$HOME/Documents/"      # home directory
sdate="2020-03-15"              # start date in yyyy-mm-dd
edate="2020-06-15"              # end date in yyyy-mm-dd
stime="00:00:00"                # start time in HH:MM:SS
etime="23:59:59"                # end time in HH:MM:SS
```

Output:

```console
name: Gihyuk Ko
from: 2020-03-15 00:00:00
to: 2020-06-15 23:59:59
commits: 250
lines: 1088070
```

### TODOs
- error msgs
- authorname / email distinction