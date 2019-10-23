import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"
filename = "Shimelba_HostCommunity_Survey_results.csv"
fullpath = os.path.join(mainpath, filename)

data = pd.read_csv(fullpath)

def dfReMake(df,col1,col2):
    for column in df.columns:
        if column == col1:
            x = dfCommunity.columns.get_loc(col1)
        else: 
            if  column == col2:
                    y = dfCommunity.columns.get_loc(col2)
                    
    df.drop(df.columns[:x],axis = 1, inplace = True)
    df.drop(df.columns[y-1:],axis = 1, inplace = True)
    return

data.set_index("group_lj1dr54:refugee_community",inplace=True)
dfCommunity = data.loc['community']
dfCommunity.reset_index().to_csv('archivoCommunity.csv',header = True, index=False)
dfCamp = data.loc['refugee']
dfCamp.reset_index().to_csv('archivoShimelba.csv',header = True, index=False)
dfReMake(dfCommunity,"group_lj1dr54:_4_Choose_the_name_of_the_host","group_lj1dr54:age")
dfReMake(dfCamp,"group_lj1dr54:_4_Choose_the_name_of_the_host","group_lj1dr54:age")