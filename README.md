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
- Number of Observations
- Number of Features
- Number of Classes
- Imbalance Ratio (IR)

`IR` is defined only for binary data sets.

### Statistical Measures
- Geometric Mean Ratio of Standard Deviations
- Mean Absolute Correlation Coefficient

### Measures of Overlap of Individual Feature Values
- Fisher's Discriminant Ratio (F1)
- Volume of Overlap Region (F2)

Unfortunately the `F1` and `F2` measures are implemented only for binary data
sets. General versions will be made available soon.

### Measures of Separability of Classes
- Ratio of Average Intra/Inter Class 1-NN Distance (N2)
- Error Rate of 1-NN Classifier (N3)

### Measures of Geometry, Topology, and Density of Manifolds
- Average Number of Points per Dimension (T2)

## References
Definitions and explanations of most functions implemented in the `dcme`
package can be found in the following literature:

[1] Michie, D., Spiegelhalter, D. J., & Taylor, C. C. (1994). **Machine
learning, neural and statistical classification**.

[2] Ho, T. K., & Basu, M. (2002). **Complexity measures of supervised
classification problems**. _IEEE transactions on pattern analysis and machine
intelligence, 24_(3), 289-300.
