# Linux & Git Assignment

A few Bash scripts I put together while working through file handling, automation with cron, and version control with Git. Everything was built and tested on Ubuntu (WSL).

## Content

1. ETL process - downloads and cleans up a CSV dataset
2. Cron Automation — runs the pipeline on a schedule
3. CSV & JSON Organizer — tidies up loose CSV/JSON files into one folder


## 1.ETL process

**Script:** `linux_assignment.sh`

Downloads a CSV from a URL (kept in an environment variable so it's not hardcoded), stashes it in a `raw/` folder, fixes up a column name, and extracts 4 columns into a separate file.

**Steps it runs through:**
- Reads the download link from `ASSIGNMENT_URL`
- Pulls the file down with `curl`
- Makes a `raw/` folder and moves the CSV in
- Renames the `Variable_code` header to `variable_code`
- Prints out the column names/positions so you can double check them
- Extracts the relevant columns into `2023_year_financial.csv`

**To run it:**
```bash
export ASSIGNMENT_URL="https://your-data-source-url.csv"
chmod +x linux_assignment.sh
./linux_assignment.sh
```

---

## 2. Cron Automation

**Files:** `cronjob.txt`

Since cron schedules don't live in a normal project folder, I kept a copy of mine here so it's tracked in git instead of just sitting invisibly on one machine.

- `cronjob.txt` — my actual crontab line, saved as a plain text file


## 3. CSV & JSON Organizer

**Script:** `move_csv_json.sh`

A general-purpose script that grabs every `.csv` and `.json` file sitting in one folder and moves them into a `json_and_CSV` folder. Works whether there's one file or a dozen, and won't throw errors if a folder happens to have none of one type.

**Steps it runs through:**
- Checks the source folder exists (creates it if not)
- Creates the `json_and_CSV` destination folder if needed
- Rounds up matching CSV and JSON files
- Moves CSVs, then JSONs, printing what it's doing along the way
- Shows you what ended up in the destination folder at the end

**To run it:**
Update `SOURCE_DIR` and `DEST_DIR` near the top of the script to point at your folders, then:
```bash
chmod +x move_csv_json.sh
./move_csv_json.sh
```

---

## What you'll need

- Bash on Linux (or WSL)
- `curl`
- `cron` (only for project 2)
- Git


