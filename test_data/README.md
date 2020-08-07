# Data Driven Test example directory

This directory serves as an end to end testing location for project datasets.
The environment here replicates the project root directory that invokes the 
main application and contains copies of relevant input sources for each project
that is to be tested.
Notes:
 * The tests are sensitive to where they are invoked and typically need to be 
run from the application root directory.  
 * Tests assume that you have ontology-data-pipeline checked out at as a sibling repository
  to this repository, ie, ../ontology-data-pipeline  



The tests are invoked automatically by the test package
```
{root}/pytest.sh
```

The examples in this directory can also be run outside of this test environment by using:
```
{root}/run_test.sh vertnet
```
