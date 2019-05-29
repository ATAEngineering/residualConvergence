# Residual Convergence Module
This module was developed by [ATA Engineering](http://www.ata-e.com) as an 
add-on to the Loci/CHEM computational fluid dynamics (CFD) solver. The module 
is useful for steady-state simulations. It can be used to cleanly stop the 
simulation and write out the solution once the normalized mass, momentum, and
energy residuals drop below a user specified threshold. The residuals are
normalized by their maximum value within the first five iterations. The 
normalized residuals are also written out to a **output/residnorm.dat** file. 

# Dependencies
This module depends on both Loci and CHEM being installed. Loci is an open
source framework developed at Mississippi State University (MSU) by Dr. Ed 
Luke. The framework provides a rule-based programming model and can take 
advantage of massively parallel high performance computing systems. CHEM is a 
full featured open source CFD code with finite-rate chemistry built on the Loci 
framework. Both Loci and CHEM can be obtained from the 
[SimSys Software Forum](http://www.simcenter.msstate.edu) hosted by MSU.

# Installation Instructions
First Loci and CHEM should be installed. The **LOCI_BASE** environment
variable should be set to point to the Loci installation directory. The 
**CHEM_BASE** environment variable should be set to point to the CHEM 
installation directory. The installation process follows the standard 
make, make install procedure.

```bash
make
make install
```

# Usage
First the module must be loaded at the top of the **vars** file. 
The user can then specify a threshold that will stop the simulation once the
normalized residuals drop below it.

```
loadModule: residualConvergence

convergenceThreshold: 1.0e-5
```

