# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal.
"""

import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"
filename = "Shimelba_HostCommunity_Survey_results.csv"
fullpath = os.path.join(mainpath, filename)

data = pd.read_csv(fullpath)

data.set_index("group_lj1dr54:refugee_community",inplace=True)
df = data.loc['community']
df.reset_index().to_csv('archivoPrueba.csv',header = True, index=False)

data2 = pd.read_csv("C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/archivoPrueba.csv")

df2 = data2
df2.drop(['group_lj1dr54:Write_the_other_ethnic_group',
       'group_on1ls06:_2_1_Are_you_the_fam_ly_head_of_your_home',
       'group_on1ls06:number_people', 'group_on1ls06:number_adults',
       'group_on1ls06:number_children',
       'group_ab8oh18:_3_1_Who_cooks_in_your_home',
       'group_ab8oh18:Who_are_you', 'group_ab8oh18:_3_2_Where_do_you_cook',
       'group_ab8oh18:fuel_for_cooking',
       'group_ab8oh18:fuel_for_cooking_other', 'group_ab8oh18:kind_food',
       'group_ab8oh18:Specify_other_kind_o_food_you_usually_eat',
       'group_jt4im96:water_supply', 'group_jt4im96:water_supply_hours',
       'group_jt4im96:_4_3_What_time_of_da_ve_the_water_service',
       'group_jt4im96:water_collect', 'group_jt4im96:water_cost',
       'group_ta0zp37:Do_you_have_electricity_servic',
       'group_ta0zp37:Is_your_house_to_connected_to',
       'group_ta0zp37:Specify_other_generator',
       'group_ta0zp37:_5_3_What_is_your_el_our_electricity_bill',
       'group_ta0zp37:voltage_change',
       'group_ta0zp37:_5_5_How_much_money_vice_ET_Birr_month',
       'group_ta0zp37:_5_6_How_many_hours_electricity_service',
       'group_ta0zp37:household_appliances_access',
       'group_ta0zp37:Specify_other_electric_equipment',
       'group_ta0zp37:household_appliances_hours',
       'group_ta0zp37:How_many_hours_do_yo_pment_in_the_MORNING',
       'group_ta0zp37:How_many_hours_do_yo_ent_in_the_AFTERNOON',
       'group_ta0zp37:How_many_hours_do_yo_c_equipment_at_NIGHT',
       'group_ta0zp37:What_kind_of_household_applian',
       'group_ta0zp37:Specify_other_elect_the_most_important',
       'group_ge3fs27:_6_1_Have_you_performed_any_im',
       'group_ge3fs27:kind_improvements',
       'group_ge3fs27:kind_improvements_other', 'group_ge3fs27:number_rooms',
       'group_ge3fs27:_6_4_Do_you_have_an_oom_designed_to_cook',
       'group_ge3fs27:_6_5_Do_you_use_', 'group_ge3fs27:_6_6_Do_you_use',
       'group_ge3fs27:habitability_conditions',
       'group_on8wi24:sources_incomes',
       'group_on8wi24:Specify_the_work_activity',
       'group_on8wi24:Specify_others_incomes_sources', 'group_on8wi24:incomes',
       'group_on8wi24:invest', '_8_Do_you_want_to_ad_during_the_interview',
       '_9_Could_you_tell_me_iewee_agrees_to_this', 'meta:instanceID'],axis = 1, inplace = True )