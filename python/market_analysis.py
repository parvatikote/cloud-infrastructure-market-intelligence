import pandas as pd
import os

# -----------------------------
# 1. Load project datasets
# -----------------------------

DATA_DIR = "../data"

global_df = pd.read_csv(
    os.path.join(DATA_DIR, "global_market_analysis.csv")
)

regional_df = pd.read_csv(
    os.path.join(DATA_DIR, "regional_market_analysis.csv")
)

country_df = pd.read_csv(
    os.path.join(DATA_DIR, "country_market_analysis_2024.csv")
)

segment_df = pd.read_csv(
    os.path.join(DATA_DIR, "segment_market_analysis_2024.csv")
)


# -----------------------------
# 2. Basic data validation
# -----------------------------

print("Dataset shapes:")
print("Global:", global_df.shape)
print("Regional:", regional_df.shape)
print("Country:", country_df.shape)
print("Segment:", segment_df.shape)


print("\nMissing values:")
print("\nGlobal:")
print(global_df.isnull().sum())

print("\nRegional:")
print(regional_df.isnull().sum())

print("\nCountry:")
print(country_df.isnull().sum())

print("\nSegment:")
print(segment_df.isnull().sum())


# -----------------------------
# 3. Global market analysis
# -----------------------------

global_df = global_df.sort_values("Year")

market_2024 = global_df.loc[
    global_df["Year"] == 2024,
    "Market_Size_USD_mn"
].iloc[0]

market_2035 = global_df.loc[
    global_df["Year"] == 2035,
    "Market_Size_USD_mn"
].iloc[0]

growth_2024_2035 = (
    (market_2035 - market_2024) / market_2024
) * 100

cagr_2024_2035 = (
    (market_2035 / market_2024) ** (1 / 11)
) - 1


print("\nGlobal Market Analysis")
print("----------------------")
print(f"2024 Market Size: ${market_2024:,.2f} million")
print(f"2035 Market Size: ${market_2035:,.2f} million")
print(f"2024-2035 Growth: {growth_2024_2035:.2f}%")
print(f"2024-2035 CAGR: {cagr_2024_2035 * 100:.2f}%")


# -----------------------------
# 4. Regional analysis
# -----------------------------

regional_2024 = regional_df[
    regional_df["Year"] == 2024
].copy()

total_2024 = regional_2024["Market_Size_USD_mn"].sum()

regional_2024["Market_Share_%"] = (
    regional_2024["Market_Size_USD_mn"] / total_2024
) * 100

regional_2024 = regional_2024.sort_values(
    "Market_Size_USD_mn",
    ascending=False
)

print("\nRegional Market Ranking — 2024")
print(regional_2024)


# -----------------------------
# 5. Country analysis
# -----------------------------

country_df["Market_Share_%"] = (
    country_df["Market_Size_USD_mn"]
    / country_df["Market_Size_USD_mn"].sum()
) * 100

country_df = country_df.sort_values(
    "Market_Size_USD_mn",
    ascending=False
)

print("\nCountry Market Ranking — 2024")
print(country_df)


# -----------------------------
# 6. Segment analysis
# -----------------------------

segment_df = segment_df.sort_values(
    "Value",
    ascending=False
)

print("\nTop Market Segments — 2024")
print(
    segment_df[
        ["Category", "Segment", "Value"]
    ].head(10)
)


# -----------------------------
# 7. Export cleaned analysis
# -----------------------------

OUTPUT_DIR = "../outputs"

os.makedirs(OUTPUT_DIR, exist_ok=True)

regional_2024.to_csv(
    os.path.join(OUTPUT_DIR, "regional_2024_analysis.csv"),
    index=False
)

country_df.to_csv(
    os.path.join(OUTPUT_DIR, "country_2024_analysis.csv"),
    index=False
)

segment_df.to_csv(
    os.path.join(OUTPUT_DIR, "segment_2024_analysis.csv"),
    index=False
)

print("\n✅ Python market analysis completed.")
