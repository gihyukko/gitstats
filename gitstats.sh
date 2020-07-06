#!/bin/bash

### shell script for counting git contributions (num_commits, num_lines)
### please update all repos to the latest commits before running this script!
### works with bash version 3.2+

# check if git exists
if [ "$(which git)" == "" ] ; then
    echo "git not installed!" && exit
fi

author="Gihyuk Ko"              # author's name or email address
homedir="$HOME/Documents/"      # home directory
sdate="2020-06-16"              # start date in YYYY-MM-DD
edate="2020-11-15"              # end date in YYYY-MM-DD
stime="00:00:00"                # start time
etime="23:59:59"                # end time

# helper function for gitstat
gitstats() { git log --shortstat --date "local" --author "$author" --since "${sdate} ${stime}" --until "${edate} ${etime}"; }

# git repos under homedir
repos=$(find "$homedir" -name .git)

# initial values
seen=() lines=0 commits=0
for d in $repos
do
    cd ${d%/*}
    url=$(git remote -v | grep "push" | tr 'A-Z' 'a-z' | tr ':/\t@' ' ' | tr -s ' ')    # url for git remote
    url=$(sed 's/(push)//g; s/\.git//g; s/ git / /g; s/ https / /g' <<< "$url")         # cleaning

    # array contains: "[remote] [host] [portnum] [id] [repo]" ([portnum] is optional)
    IFS=' ' urlarr=($url)
    repo="${urlarr[1]} ${urlarr[@]: -2}"    # extract [hostname], [id], [repo]

    # if repo is already seen, do not count contributions
    if [[ "${seen[@]}" =~ "${repo}" ]] ; then
        continue        # continue to next iteration
    fi

    # count contributions: num_commits, num_lines
    c=$(gitstats | grep "commit" | awk 'END {print NR}')
    l=$(gitstats | grep "insertion\|deletion" | awk '{i+=$4; d+=$6} END {print i+d}')
    let commits=commits+$((c))
    let lines=lines+$((l))

    seen+=( "$repo" )       # add the repo to the seen ones
done

# print stats
printf "name: %s\n" "$author"
printf "from: %s\n" "$sdate $stime"
printf "to: %s\n" "$edate $etime"
printf "commits: %s\n" "$commits"
printf "lines: %s\n" "$lines"