# ALFchemY-MolPLACER
A basic code for creating a dimer from a molecule with accurate interplanar, x, and y displacements.
If you find this code useful, please cite MolPLACER:<br>
<a href="https://zenodo.org/badge/latestdoi/268278803"><img src="https://zenodo.org/badge/268278803.svg" alt="DOI"></a>

<h2>prerequisite:</h2>
<ul>
<li>python3</li>
<li>numpy</li>
</ul>
  If not already installed, type "pip install numpy" in the linux terminal. <br>
<ul>  
<br>
<li>MolPLACER 1.0 require a planar fragment in your molecule. Please make sure that the first 3 atoms are in the reference plane. If the molecule is completely planar, it works perfectly.</li>
<ul>
<h2>Steps:</h2>
Steps to create a dimer with custom interplanar distance, x axis displacement and y axis displacement.
<ul>
<li>Create an .xyz file of the molecule (monomer) in a directory.</li>
<li>Rename the .xyz file to mol.xyz.</li>
<li>Copy the two files (MolPLACER.sh,vect.py) of ALFchemY-MolPLACER to the same directory.</li>
<li>Open a terminal in the directory and type "./MolPLACER".</li>
<li>The code asks for the interplanar distance (in Angstrom) you desire for the dimer.</li>
<li>Now, the code asks for one of the atom which is aligned to the x axis you disire.</li>
<li>Enter the two atoms for defining the x axis one by one.</li>
<li>Enter the x axis displacement</li>
<li>Enter the y axis displacement</li>
<li>You will find that a new file named "fixed.xyz" is formed in the directory. Open it (Eg. in Mercury) and save it again in any other format (.mol2,.xyz,.pdb etc.) for further use.</li>
<br>
Please note that I am a beginner in coding and there are chances that the code can have some bugs. So if you find any issues with MolPLACER, please feel free to contact me via email:alfysmail@gmail.com

