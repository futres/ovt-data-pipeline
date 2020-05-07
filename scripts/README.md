# Data Validation and Loading Using Command-Line

 * These scripts use python 3+
 * You may need to pip install required modules as python complains about them

For very large datasets and datasets we are scripting, we do not want to load them directly into GEOME
and so we can use the ```futres_validator.py``` script to check the dataset is OK.  We can then leave the 
dataset in a note the 'passed' datasets that we want to pull in outside of GEOME.

We can continue to use GEOME for user-contributed datasets and smaller sets (e.g. those with fewer than 30,000 records).

## Here are the scripts
futres_validator.py tests data only and doesn't load
futres_uploader.py loads data from command line

```
# test running code using the provided example dataset
python futres_validator.py test.csv

# the following command should return a '0' for success and '1' for error.
# thus, you can script this to automatically determine the results (beyond
# actually reading the messages on the output)
echo $?
```
