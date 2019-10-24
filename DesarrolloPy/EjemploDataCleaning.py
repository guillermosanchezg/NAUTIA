import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"
filename = "Shimelba_HostCommunity_Survey_results.csv"
fullpath = os.path.join(mainpath, filename)

data = pd.read_csv(fullpath)

def dfFix(df,col1,col2):
    result = df
    x = result.columns.get_loc(col1)
    result.drop(result.columns[:x],axis = 1, inplace = True)
    y = result.columns.get_loc(col2)
    result.drop(result.columns[y+1:],axis = 1, inplace = True)
    return result

def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1)

def mkCSV(df,fileName):
    df.reset_index().to_csv('DataSetFinales/'+fileName,header = True, index=False)

    

data.set_index("group_lj1dr54:refugee_community",inplace=True)

dfCommunity = data.loc['community'].copy()
dfCommunity = dfFix(dfCommunity,"group_lj1dr54:age","group_lj1dr54:_1_5_Choose_the_ethnic_group_o")
mkCSV(dfCommunity,"archivoCommunity.csv")

dfCamp = data.loc['refugee'].copy()
dfCamp = dfFix(dfCamp,"group_lj1dr54:age","group_lj1dr54:_1_5_Choose_the_ethnic_group_o")
mkCSV(dfCamp,"archivoShimelba.csv")

dfToAdd = data
dfToAdd = dfToAdd.loc['community'].copy()
dfToAdd = dfFix(dfToAdd,"group_on1ls06:number_people","group_on1ls06:number_people")

dfFinalCommunity = concatDF(dfCommunity,dfToAdd)
mkCSV(dfFinalCommunity,"archivoCommunityFinal.csv")

