# Steering-Evaluator-2

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


## Load models

```shell
mkdir ckpts
```

* Train models using <a href="https://github.com/RobertSamoilescu/Steering-Network-1">this repo</a>

* Copy the folders inside the snapshots dir into the ckpts dir.
