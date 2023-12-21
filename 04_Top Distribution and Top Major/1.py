from sqlalchemy import create_engine
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
exit(-1)

engine = create_engine('postgresql://postgres:postgres@localhost/postgres')

def get_dataframe() :
    query = """
                select units,
                    volume,
                    value,
                    m.short as mkt_short,
                    p.long as prod_long,
                    TO_DATE(SUBSTRING(t.long , 3), 'DD Month YYYY') as wdate,
                    t.display_order as weeknumber
                    --, acv_distribution_w, numeric_distribution_w, weight_distribution_w, base_units, base_units_any_promo, base_units_no_promo, base_units_feat_and_display, base_units_display_only, base_units_feature_only, base_units_unsupported, base_units_total_multibuy, base_units_feature_or_display, base_volume, base_volume_any_promo, base_volume_no_promo, base_volume_feat_and_display, base_volume_display_only, base_volume_feature_only, base_volume_unsupported, base_volume_total_multibuy, base_volume_feature_or_display, base_value, base_value_any_promo, base_value_no_promo, base_value_feat_and_display, base_value_display_only, base_value_feature_only, base_value_unsupported, base_value_total_multibuy, base_value_feature_or_display, numeric_distribution, weight_distr, acv_distribution, stores_in_universe, units_c_any_promo, units_c_no_promo, units_c_feat_and_display, units_c_display_only, units_c_feature_only, units_c_unsupported, units_c_total_multibuy, units_c_feature_or_display, volume_c_any_promo, volume_c_no_promo, volume_c_feat_and_display, volume_c_display_only, volume_c_feature_only, volume_c_unsupported, volume_c_total_multibuy, volume_c_feature_or_display, value_c_any_promo, value_c_no_promo, value_c_feat_and_display, value_c_display_only, value_c_feature_only, value_c_unsupported, value_c_total_multibuy, value_c_feature_or_display, acv_distribution_c_any_promo, acv_distribution_c_feat_and_display, acv_distribution_c_display_only, acv_distribution_c_feature_only, acv_distribution_c_unsupported, acv_distribution_c_total_multibuy, acv_distribution_c_feature_or_display, numeric_distribution_w_c_any_promo, numeric_distribution_w_c_feat_and_display, numeric_distribution_w_c_display_only, numeric_distribution_w_c_feature_only, numeric_distribution_w_c_unsupported, numeric_distribution_w_c_total_multibuy, numeric_distribution_w_c_feature_or_display, weight_distribution_c_any_promo, weight_distribution_c_feat_and_display, weight_distribution_c_display_only, weight_distribution_c_feature_only, weight_distribution_c_unsupported, weight_distribution_c_total_multibuy, weight_distribution_c_feature_or_display, tdp_w, tdp_w_any_promo, tdp_w_no_promo, tdp_w_feat_and_display, tdp_w_display_only, tdp_w_feature_only, tdp_w_unsupported, tdp_w_total_multibuy, tdp_w_feature_or_display, tdp, tdp_any_promo, tdp_no_promo, tdp_feat_and_display, tdp_display_only, tdp_feature_only, tdp_unsupported, tdp_total_multibuy, tdp_feature_or_display, sales_eq2, sales_eq2_cau_any_promo, ac_weight_average_number_sku_w, ac_weight_average_number_sku_w_display_only, ac_weight_average_number_sku_w_feature_only, price_per_eq, total_acv_distribution_points__w, total_acv_distribution_points__w_any_promo, total_acv_distribution_points__w_no_promo, total_acv_distribution_points__w_feat_and_display, total_acv_distribution_points__w_display_only, total_acv_distribution_points__w_feature_only, total_acv_distribution_points__w_unsupported, total_acv_distribution_points__w_total_multibuy, total_acv_distribution_points__w_feature_or_display, total_acv_distribution_points, total_acv_distribution_points_any_promo, total_acv_distribution_points_no_promo, total_acv_distribution_points_feat_and_display, total_acv_distribution_points_display_only, total_acv_distribution_points_feature_only, total_acv_distribution_points_unsupported, total_acv_distribution_points_total_multibuy, total_acv_distribution_points_feature_or_display
                from fact f
                left join dim_mkt m on m.tag = f.mkt_tag
                left join dim_prod p on p.tag = f.prod_tag
                left join dim_per t on t.tag = f.per_tag
                where --f.mkt_tag = 'M000000000000103175300000000000001065615' 
                         f.prod_tag = 'P000000000000030453200000000011197286337'
                        --and t.long = 'WE 16 June 2018'
                        --and p.long = 'DOY DETERGENT FINSH-QNTM-PWR&PR'
                order by units
            """
    return pd.read_sql_query(query,con=engine)

df = get_dataframe()
# df = df.dropna(subset=['units'])
df['units'].fillna(0, inplace=True)
df['units'] = df['units'].astype(int)
df['units'] = df.units.abs()

wdates = df['wdate'].unique()
mkts = df['mkt_short'].unique()
prods = df['prod_long'].unique()
print(prods)
for w in wdates:
    for mkt in mkts :
        for prod in prods:
           if not ((df['wdate'] == w) & (df['mkt_short'] == mkt) & (df['prod_long'] == prod)).any() :
               df.loc[len(df.index)] = [0,0,0,mkt,prod,w,0]

plt.figure(figsize=(20,16))
sns.lineplot(x='wdate', y='units', hue='mkt_short', data=df)

plt.show()
print(df.head())