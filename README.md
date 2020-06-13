# Steering-Evaluator-2

One drawback of our <a href='https://github.com/RobertSamoilescu/Steering-Evaluator-1'> previous closed-loop evaluation </a> is that the simulator uses the same 2D perspective augmentation techniques present in the training dataset. We believe that there is a possibility that the bending objects may guide the policy to recover. We investigate this information leakage in our improved simulator by performing perspective augmentations that use the depth information and inpainting to avoid introducing artifacts in the evaluation procedure.

<p align='center'>
  <img src='sample/new_sim.gif' alt='new simulation' />
</p>

<p align='center'>
  <img src='sample/old_sim.gif' alt='old simulation' />
</p>


## Create dataset

```shell
mkdir raw_dataset
```

* Download the UBP dataset into the "raw_dataset" directory. A sample of the UPB dataset is available <a href="https://drive.google.com/drive/folders/1p_2-_Xo-Wd9MCnkYqPfGyKs2BnbeApqn?usp=sharing">here</a>.

```shell
mkdir scene_splits
```

* Download the scene splits into the "scene_splits" directory. The train-validation split is available <a href="https://github.com/RobertSamoilescu/UPB-Dataset-Split">here</a>.
In the "scene_splits" directory you should have: "train_scenes.txt" and "test_scenes.txt".


## Load steering models

```shell
mkdir ckpts
```

* Train models using <a href="https://github.com/RobertSamoilescu/Steering-Network-1">this repo</a>

* Copy the folders inside the snapshots dir into the ckpts dir.


## Load augmentation pipeline models

```shell
cd pipeline/models/monodepth
```
For monodepth, download the pre-trained models from <a href='https://drive.google.com/drive/folders/18kTR4PaRlQIeEFJ2gNkiXYnFcTfyrRNH?usp=sharing'>here</a>

```shell
cd pipeline/models/inpaint
```
For the inpaint, download the pre-trained model from <a href='https://drive.google.com/drive/folders/1oeVxVnR5BIZ1QM-ClY6Xa4CogxTQzmZx?usp=sharing'>here</a>


## Run multiple simulations
```shell
./multiple_runs.sh
```

## Results

|Model      | Evaluation augmentation |  AG   | A    | NI     | MAD/MSTI | MAA/MSTI | VL+P    |
|-----------|-------------------------|-----  |------|---- ---|----------|----------|---------|
|ResNet18   |       2D                | No    | 0.67 |  248   |  0.0130  | 0.0731   | 4548.16 |  
|ResNet18   |       3D                | No    | 0.69 |  228   |  0.0107  | 0.0675   | 4428.16 |
|ResNet18   |       2D                | Yes   | 0.80 |  128   |  0.0048  | 0.0393   | 3828.16 |
|ResNet18   |       3D                | Yes   | 0.75 |  170   |  0.0073  | 0.0494   | 4080.16 |  

The table displays the performance of the ResNet18 models, trained with and without 2D augmentation, in the two simulators. We observe a significant drop of 5% in autonomy, which supports our hypothesis that there exist data leakages in our previous closed-loop evaluation method. The discrepancy in the results of the 2D augmentation method is emphasized in autonomy improvement when evaluated with the improved simulator.

## View intervention points
```shell
python3 view.py
```
<p align='center'>
  <img src='https://github.com/RobertSamoilescu/Steering-Evaluator-1/blob/master/sample/interventions.png' alt='example intervention points'/>
</p>
