import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"
filename = "Shimelba_HostCommunity_Survey_results.csv"
fullpath = os.path.join(mainpath, filename)

data = pd.read_csv(fullpath)

def dfReMake(df,col1,col2):
    result = df
    x = result.columns.get_loc(col1)
    result.drop(result.columns[:x],axis = 1, inplace = True)
    y = result.columns.get_loc(col2)
    result.drop(result.columns[y+1:],axis = 1, inplace = True)
    return result

data.set_index("group_lj1dr54:refugee_community",inplace=True)

dfCommunity = data.loc['community'].copy()
dfCommunity = dfReMake(dfCommunity,"group_lj1dr54:age","group_lj1dr54:_1_5_Choose_the_ethnic_group_o")
dfCommunity.reset_index().to_csv('DataSetFinales/archivoCommunity.csv',header = True, index=False)

dfCamp = data.loc['refugee'].copy()
dfCamp = dfReMake(dfCamp,"group_lj1dr54:age","group_lj1dr54:_1_5_Choose_the_ethnic_group_o")
dfCamp.reset_index().to_csv('DataSetFinales/archivoShimelba.csv',header = True, index=False)
