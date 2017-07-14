# dcme
## Overview
The `dcme` package provides functions to compute complexity measures for data
sets.

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
