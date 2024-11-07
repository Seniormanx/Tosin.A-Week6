# GitHub Repository, Data Retrieval Script, and Workflow Automation

## Project Overview 
This project focuses on GitHub repository setup, data retrieval using shell scripting, and workflow automation with GitHub actions. The purpose os to create a verssion-controlled data retrieval system that uses GitHub's automated tool to ensure high-quality code. The primary objective are to:

1. Set up a GitHub repository and structure it for data retrieval and automation.
2. Create a shell script (`retrieve_data.sh`) that retrieves data based on specified version parameters.
3. Automate code quality checks using GitHub Actions with a custom linter configuration.
4. Integrate Super-Linter for linting shell scripts, YAML, and Markdown files with custom rules.

## Project Structure 
- **.github/workflows**: Stores the `code_linter.yml` file, which configures GitHub Actions to run code quality checks on each commit.
- **datahub**: Contains `data.json`, the main data file that is updated based on the specified version in the parameters file.
- **retrieve_data.sh**: A shell script that retrieves data from an API, processes it, and manages versioning.
- **README.md**: This file, describing the project, setup instructions, and usage.
## Setup Instructions

### Step 1: Repository Creation
1. Create a GitHub repository named `<your-name>-week6`.
2. Clone the repository to your local machine.

### Step 2: Create Project Files
1. **Directory Structure**:
   - `.github/workflows`: Add `code_linter.yml` for automated linting.
   - `datahub`: Stores `data.json`, the file where versioned data will be saved.
   - `retrieve_data.sh`: Script for retrieving data based on the specified version.

2. **params.yml**: Define the version and size parameters. Set up version-size pairs as follows:
   - `"1.0"` -> `1000`
   - `"1.1"` -> `2000`
   - `"1.2"` -> `3000`

### Step 3: Script (`retrieve_data.sh`) Specifications
   - Reads the `version` from `params.yml` and fetches the data corresponding to the size specified.
   - Uses `curl` to pull data from the provided API and `jq` to format and limit the results.
   - Checks if the new data is different from the current data in `datahub/data.json`:
     - If identical, displays "No changes; data has not changed."
     - If different, updates `datahub/data.json` with the new data.

### Step 4: GitHub Actions Setup
   - In `.github/workflows`, create `code_linter.yml` to enable automated code quality checks on each commit, using customized Super-Linter rules for shell scripts, YAML, and Markdown.

### Step 5: Commit and Push Changes
   - Add all files to your main branch and commit with a meaningful message, e.g., "Initial setup with data retrieval script and GitHub Actions."

## Working with Branches and Data Versions

1. Create three branches:
   - `data-v1.0`
   - `data-v1.1`
   - `data-v1.2`

2. **Data Retrieval for Each Branch**:
   - Update the version in `params.yml` to match the branch version.
   - Run `retrieve_data.sh` to fetch data, confirm dataset size, and save it to `datahub/data.json`.
   - Display:
     - Current data version
     - Total dataset size (verified with `data.json`)
     - Sample of three rows from `data.json`

3. **Repeat Process Across Branches**:
   - Ensure that `retrieve_data.sh` fetches the correct versioned data for each branch.

---
