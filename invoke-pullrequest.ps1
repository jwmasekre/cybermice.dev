# This script is designed to provide an interactive interface
# for submitting pull requests for docs.cybermice.dev
# on Windows machines.

# If desired, we recommend sumbitting a pull request with
# a version of this script in the language of your choice.

# See https://docs.cybermice.dev/contributions/index.html for
# more information regarding this process.

#static variables
$global:git = "https://github.com/jwmasekre/cybermice.dev.git"

# main function of the script
function invoke-pullrequest {
    # Checks to make sure we are running in the location the cybermice.dev repo is cloned to and that git is installed and added to PATH
    Write-Host "Verifying runtime..." -ForegroundColor Cyan
    if (test-path ".\.git\config") {
        $configdata = get-content .\.git\config
        $linec = 0
        foreach ($line in $configdata) {
            $linec += 1
            if ($line -eq "[remote `"origin`"]") {
                break
            }
        }
        if ($configdata[$linec] -notlike "*jwmasekre/cybermice.dev.git") {
            Write-Host "Error: Current directory is not a clone of cybermice.dev. Please switch to the directory cybermice.dev is cloned into before proceeding." -ForegroundColor Black -BackgroundColor Red
            exit
        }
        else {
            Write-Host -NoNewLine "Currently in the " -ForegroundColor Green
            Write-Host -NoNewline "cybermice.dev" -ForegroundColor Cyan -BackgroundColor DarkMagenta
            Write-Host " directory." -ForegroundColor Green
        }
    }
    else {
        Write-Host "Error: This script does not appear to be running in the directory cybermice.dev is cloned into. Please switch to that directory before proceeding." -ForegroundColor Black -BackgroundColor Red
        exit
    }
    if ($null -eq (Get-Command "git" -ErrorAction SilentlyContinue)) {
        Write-Host "Error: Git does not exist in PATH. Please enusre Git is installed and is in PATH so this script can use it." -ForegroundColor Black -BackgroundColor Red
        exit
    }
    else {
        Write-Host "Git is installed and in PATH." -ForegroundColor Green
    }
    Write-Host "Runtime meets minimum requirements." -ForegroundColor Green
    # Checks to make sure we are starting in master branch
    Write-Host "Verifying current branch..." -ForegroundColor Cyan
    $global:currentbranch = get-content ".\.git\HEAD"
    if ($currentbranch -ne "ref: refs/heads/master") {
        get-branchcheckoutresponse
    }
    else {
        Write-Host "Branch is currently master." -ForegroundColor Green
    }
    # Initiates the process
    Write-Host -NoNewline "Getting the most recent version of " -ForegroundColor Cyan
    Write-Host "docs.cybermice.dev" -ForegroundColor Cyan -BackgroundColor DarkMagenta
    git pull
    Write-Host -NoNewLine "docs.cybermice.dev" -ForegroundColor Cyan -BackgroundColor DarkMagenta
    Write-Host "should be updated" -ForegroundColor Green
    Write-Host "What would you like your branch to be named?" -ForegroundColor Cyan
    get-branchnameresponse
    Write-Host "Using $branchname" -ForegroundColor Green
    git branch $branchname
    git checkout $branchname
    Write-Host "$branchname branch has been created and checked out. Please make any changes you'd like to commit, and then enter `"continue`" to continue..." -ForegroundColor Cyan
    get-continueresponse
    Write-Host "Continuing..." -ForegroundColor Cyan
    git add --all
    Write-Host "Please enter a comment for the commit." -ForegroundColor Cyan
    get-commitcomment
    Write-Host "Committing with comment $commitcomment..." -ForegroundColor Cyan
    git commit -m "$commitcomment"
    Write-Host -NoNewLine "Pushing to " -ForegroundColor Cyan
    Write-Host "$branchname..." -ForegroundColor White
    git push -u origin $branchname
    Write-Host -NoNewline "Assuming nothing errored out, please proceed to " -ForegroundColor Green
    Write-Host -NoNewline "https://github.com/jwmasekre/cybermice.dev" -ForegroundColor White
    Write-Host -NoNewline " and follow the instructions at " -ForegroundColor Green
    Write-Host -NoNewline "https://docs.cybermice.dev/contributions/index.html" -ForegroundColor White
    Write-Host " (step 8) to complete the pull request."
}

# asks if the user wants to switch to master branch 
function get-branchcheckoutresponse {
    $currentbranchx = ($currentbranch -split "/")[2]
    Write-Host -NoNewLine "Warning: Current branch is " -ForegroundColor Red -BackgroundColor Black
    Write-Host -NoNewline "$currentbranchx" -ForegroundColor White -BackgroundColor Gray
    Write-Host -NoNewLine ", not " -ForegroundColor Red -BackgroundColor Black
    Write-Host -NoNewLine "master" -ForegroundColor White -BackgroundColor Gray
    Write-Host -NoNewLine ". This could lead to missing files while conducting a" -ForegroundColor Red -BackgroundColor Black
    Write-Host -NoNewline " git pull" -ForegroundColor Yellow
    Write-Host ". Switch to master branch? [Y]/N" -ForegroundColor Red -BackgroundColor Black
    $answer = read-host ">"
    switch ($answer) {
        "" {
            write-host "Switching to master" -ForegroundColor Cyan
            git checkout master
            break
        }
        "Y" {
            write-host "Switching to master" -ForegroundColor Cyan
            git checkout master
            break
        }
        "N" {
            write-host "Sticking with $currentbranchx" -ForegroundColor Magenta
            break
        }
        default {
            Write-Host "Invalid input." -ForegroundColor Red -BackgroundColor Black
            get-branchcheckoutresponse
        }
    }
}

# asks what name the user would like the branch to be
function get-branchnameresponse {
    $global:branchname = read-host ">"
    switch -regex ($branchname) {
        '^[a-zA-Z0-9]*$' {break}
        default {
            Write-Host "Please use an alpha-numeric branch name with no spaces or special characters." -ForegroundColor Red -BackgroundColor Black
            get-branchnameresponse
        }
    }
}

# awaits the user to type and send "continue" to verify they've completed their contributions
function get-continueresponse {
    $response = Read-Host ">"
    switch ($response) {
        "continue" {break}
        default {
            Write-Host "Please type `"continue`" to continue." -ForegroundColor Red -BackgroundColor Black
            get-continueresponse
        }
    }
}

# gets the comment for the commit
function get-commitcomment {
    $global:commitcomment = read-host ">"
    switch -regex ($commitcomment) {
        '^[a-zA-Z0-9 ]*$' {break}
        default {
            Write-Host "Please use an alpha-numeric and spaces with no special characters. Concision is king." -ForegroundColor Red -BackgroundColor Black
            get-commitcomment
        }
    }
}

invoke-pullrequest