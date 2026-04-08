import pandas as pd
import os
os.chdir(r"C:\Users\Radha Sharma\Downloads\fraud_detection_project")
def load_data():
    df =pd.read_csv("data/creditcard.csv")
    print("data loaded successfully")
    return df
def basic_checks(df):
    print("\nshape of dataset:",df.shape)
    print("\ncolumns:",df.columns)
    print("\nMisiing values:\n:",df.isnull().sum())
    print("\nFraud distribution:\n",df['Class'].value_counts())
def clean_data(df):
    df=df.drop_duplicates()
    print("\nduplicates removed")
    return df
def feature_engineering(df):
    df['Hour']=df['Time']//3600
    df['Day']=df['Time']//(3600*24)
    print("\nNew features created:Hour,Day")
    return df
def save_data(df):
    df.to_csv("output/cleaned_fraud_data.csv", index=False)
    print("\nfile saved in output folder")


# Main function
if __name__ =="__main__":
    df=load_data()
    basic_checks(df)
    df=clean_data(df)
    df =feature_engineering(df)
    save_data(df)


