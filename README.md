# US and EU Climate Policies, materials impact on EV battery cost

This is the README of the project of Energy Climate Change Modeling and scenarios Course (Academic Year 2022/2023).

The project was carried out using two programming languages: GAMS and R.

## How to navigate this Repository:

Inside there is only the modules folder of the WITCH model so it's faster to do the updates.

To set it is necessary to carry out the following steps:

1) download a default version of Witch and place it in the same folder where ECC-Project2 is.

2) delete the folder modules and data_witch17.

3) open modules.gms and replace line 6 with:
$set mp '../ECC-Project2/modules'.

4) open run_witch17 and on line 27 replace with
$setglobal datapath '../ECC-Project2/data_%datapathext%/'.


## Team members
  * [M. Cosi](https://github.com/michelecosi)
  * [D. Cosmo]()
  * [N. Della Valle]()      
  * [E. Modina](https://github.com/ettoremodina)   



