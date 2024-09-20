#Check if any syntax error in .py files.
files = $(git diff --cached --name-only --diff-filter=ACM | grep '\.py$')
flake8 $files       #flake8 is a tool to check syntax errors of python.

# Pre-commit hook if any sensitive data is committed to push.
if git grep -q "password\|secret_key\|API_KEY" $(git diff --cached --name-only); then
    echo "ATTENTION!! Don't commit sensitive data."
    exit 1
fi
