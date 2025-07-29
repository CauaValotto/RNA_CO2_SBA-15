# RNA_CO2_SBA-15
Neural Network (MLP) model in MATLAB to predict CO₂ adsorption on SBA-15 silicas, aiming at the optimization of materials for carbon capture.

This repository contains all the files and data from my final project for the extension course "Neural Networks Applied to Chemical Processes" at UNIFESP. The project consists of developing a Neural Network (Multilayer Perceptron - MLP) model to predict the CO₂ adsorption capacity on SBA-15 type mesoporous silicas.

# Project Objective

The main objective was to develop an Artificial Intelligence model capable of functioning as a virtual screening tool. The idea is to accelerate the discovery of new materials for carbon capture by predicting their performance even before the need for laboratory synthesis, which saves time and resources.

# File Structure

Here is a description of each file present in this repository:

* **MATLAB Scripts (`.m`)**
    * `Script_RNA_Regressao.m`: **Main Script** - This is the main file of the project. It loads the data, defines the neural network architecture, performs the training, and runs the simulations.
    * `Correlograma_projeto.m`: Script used to generate the correlation matrix between the study variables.
    * `plotCorrelograma.m`: Helper script to visually plot the correlogram.

* **Data (`.xlsx`, `.mat`)**
    * `Dados.xlsx`: Main spreadsheet with all compiled experimental data used to train and validate the model.
    * `Organização dos dados.xlsx`: Supporting spreadsheet that details the structuring and separation of data for the project stages.
    * `Mg-SBA-15-CO2-293K.mat` and `MgK_SBA_15_313K.mat`: MATLAB data files containing the two isotherms that were completely set aside for the final simulation stage, testing the model's generalization capability.

* **Documentation (`.pdf`)**
    * `Apresentação Redes (1).pdf`: The slide presentation used in the final project defense, containing the graphs and results.
    * `zukal2013.pdf`: The original scientific paper by Zukal, A., Pastva, J., & Čejka, J. (2013), from which the experimental data were extracted.

# How to Use

1.  **Prerequisites:** MATLAB must be installed with the "Deep Learning Toolbox".
2.  **Execution:** Open the `Script_RNA_Regressao.m` file in MATLAB.
3.  Ensure that all data files (`.xlsx` and `.mat`) are in the same folder or that the path to them is correct within the script.
4.  Run the script to train the model, visualize the performance graphs, and run the simulations.

# References and Acknowledgements

The experimental data used in this work were extracted from the following article:
Zukal, A., Pastva, J., & Čejka, J. (2013). *MgO-modified mesoporous silicas impregnated by potassium carbonate for carbon dioxide adsorption*. Microporous and Mesoporous Materials, 167, 44–50. DOI: http://dx.doi.org/10.1016/j.micromeso.2012.05.026

Acknowledgements to Prof. Dr. Tiago Dias Martins and to UNIFESP for the opportunity and guidance during the course.
