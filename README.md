# dcme
## Overview
The `dcme` package provides functions to compute data complexity measures.

## Installation
`dcme` is under development and not yet available on CRAN. You can install the
development version using the `devtools` package as follows:

```r
# install.packages("devtools")
devtools::install_github("RomeroBarata/dcme")
```

## Data Complexity Measures
The following complexity measures are currently implemented:

### Simple Measures
- `num_examples`: Number of Observations
- `num_examples_majority`: Number of Observations in the Majority Class
- `num_examples_minority`: Number of Observations in the Minority Class
- `num_features`: Number of Features
- `num_classes`: Number of Classes
- `IR`: Imbalance Ratio

`num_examples_majority`, `num_examples_minority`, and `IR` are defined only for binary data sets.

### Statistical Measures
- `sd_ratio`: Geometric Mean Ratio of Standard Deviations
- `corr_abs`: Mean Absolute Correlation Coefficient

### Measures of Overlap of Individual Feature Values
- `F1`: Fisher's Discriminant Ratio
- `F2`: Volume of Overlap Region

Unfortunately the `F1` and `F2` measures are implemented only for binary data
sets. General versions will be made available soon.

### Measures of Separability of Classes
- `N2`: Ratio of Average Intra/Inter Class 1-NN Distance
- `N3`: Error Rate of 1-NN Classifier

### Measures of Geometry, Topology, and Density of Manifolds
- `T2`: Average Number of Points per Dimension

## References
Definitions and explanations of most functions implemented in the `dcme`
package can be found in the following literature:

[1] Michie, D., Spiegelhalter, D. J., & Taylor, C. C. (1994). **Machine
learning, neural and statistical classification**.

[2] Ho, T. K., & Basu, M. (2002). **Complexity measures of supervised
classification problems**. _IEEE transactions on pattern analysis and machine
intelligence, 24_(3), 289-300.
