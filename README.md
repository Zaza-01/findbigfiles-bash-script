# findbigfiles.sh

## Description
This Bash script allows users to find files within the present working directory that are larger than a specified size in megabytes.

## Usage
```bash
./findbigfiles.sh [Number of MB]
```
Example:
```bash
./findbigfiles.sh 5
```

## Author
- Moataz Osama

## Features
- Searches for files larger than the specified size in megabytes.
- Displays the number of files found and their names.

## Functions
### `usage`
Displays information on how to use the script.

### `trap_exit`
Handles script exit and displays a message upon receiving certain signals.

## Execution
1. Run the script with the desired size in megabytes as an argument.
2. The script will search for files in the present working directory larger than the specified size.
3. Results, including the number of files found and their names, will be displayed.

## Additional Notes
- The script uses the `find` command to perform the search.
- Temporary files are created during execution and removed afterward.

## License
This script is released under the [MIT License](LICENSE).
