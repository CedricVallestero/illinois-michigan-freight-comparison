# Illinois versus Michigan Freight Analysis
This project analyzes the freight flows of Illinois and Michigan, two prominent midwestern states in American logistics/supply chain.

## The Questions
What commodities dominate Illinois and Michigan's outbound freight by total value and what is their total tonnage?

For those top commodities, which mode of transport dominates?

## Data Source
BTS Freight Analysis Framework (FAF6.0 State database for 2022)

### Link
https://www.bts.gov/faf

### Description (pasted from FAF, you can find it in the link)
The Freight Analysis Framework (FAF) database provides estimates of US freight flows. The FAF provides data for states and metropolitan areas. Flows include all modes of transportation and 42 commodity types. 

### Why I chose FAF
I personally chose FAF as my source for three main reasons. Firstly, it provides key economic data such as tonnage and financial value that I can aggregate and analyze. Secondly, the dataset also covers important modes like truck, rail, water, air, pipeline, etc etc. Lastly and arguably the most important reason being that FAF metadata covers a wide range of commodities rather than just focusing on one group (it covers food, pharmaceuticals, electronics, machinery, furniture, motorized vehicles, raw materials, etc etc) which gives me a larger picture to analyze.

### Why I chose Illinois and Michigan
I chose Illinois because it is a major logistics hub in the US. The state's central location connects the East and West Coasts as well as the North and South. Also, given the location, a truck can reach a big chunk of the country within a 1500 mile radius. For reference, the average truck driver in the US can cover about 500 miles a day ([Source: Anderson Trucking Service](https://www.atsinc.com/blog/how-many-miles-truck-driver-allowed-drive-day)), which makes 1500 achievable in roughly 3 days.

I chose Michigan because it is also a major logistics hub in the US. The state's close access to the US/Canada border allows for accessible international logistics and its history in the automotive industry is an important driving factor as to why many manufacturing plants are active in the state.

## Process
Pipeline overview: CSV -> PostgreSQL -> SQL (cleaning, joins, validation, ranking) -> Power BI (power query, visualization).

Note on validation: it includes checking for inadmissible values (like negatives) and ridiculously large values and zeros if it doesn't make sense in that context.

## Findings

### Commodity Composition (ranked by sum of value) 

Note: I rounded total values to the nearest thousand and total tons to the nearest hundred for readability

Illinois's top 5 commodities are:

1. Electronics (190k total value, 9.3k tons)
2. Pharmaceuticals (144k total value, 2.7k tons)
3. Machinery (80k total value, 6.8k tons)
4. Mixed Freight (78k total value, 20.7k tons)
5. Motorized Vehicles (74k total value, 7.9k tons)

Michigan's top 5 commodities are:

1. Motorized Vehicles (224k total value, 27.8k tons)
2. Machinery (79k total value, 5.9k tons)
3. Electronics (51k total value, 2.8k tons)
4. Mixed freight (41k total value, 12.6k tons)
5. Plastics/rubber (37k total value, 9.8k tons)

<img width="568" height="352" alt="image" src="https://github.com/user-attachments/assets/cd9c3d84-e0d8-4d44-aeec-60750fc3c046" />

Illinois's outbound freight value seems more evenly distributed though it skews in favor of electronics and pharmaceuticals.

Illinois's leading commodity is consistent with the high demand of electronic goods in the US (whether it is for individuals who desire an upgrade or a company adopting use) though, that connects to the bigger picture of the US being a big consumer of electronics, though, why Illinois? I believe that this may be tied to what I mentioned earlier about the state. Illinois is a giant when it comes to logistics due to its geographic advantage (being near the center of the country). This logistics infrastructure likely makes Illinois a natural distribution point for high-demand consumer goods like electronics.

Illinois's second leading commodity is its pharmaceuticals. This is consistent with the fact that Illinois is a prominent state in the healthcare and life sciences sector of the US. This is due to pharmaceutical giants like AbbVie, Abbott Laboratories and Baxter International being founded in Illinois and all currently headquartered in Illinois. That being said, those three giants being based in Illinois would in turn mean more research, testing and manufacturing of pharmaceutical commodities would take place in Illinois.

Michigan's outbound freight value seems more heavily skewed towards Motorized Vehicles as it has an overwhelming lead in both total value and tons across the top commodities in the state. I believe Michigan has very high numbers when it comes to outbound Motorized Vehicles because automakers such as Ford, Chrysler and General Motors had their original/primary manufacturing bases set up here which led to many production plants being clustered around here. Also, as I've mentioned, they have a strong advantage being near the the great lakes and US/Canada border. Due to this, shipping heavy raw materials like coal and iron (which are tied to automotive manufacturing) is more logistically convenient.

When comparing the top commodities of both states I can see that there is a big difference between them 

In Illinois, Electronics (worth about 190k and about 9.3k tons) is ranked 1st in the state but in Michigan it is worth about 51k with 2.8k tons ranking 3rd.

In Michigan, Motorized Vehicles rank 1st (worth about 224k with a total tonnage of 27.8k) whereas it ranks 5th in Illinois, (worth about 74k and 7.9k tons).

Illinois's Electronics value (190k) exceeds Michigan's (51k) by roughly 140k, while Michigan's Motorized Vehicles value (224k) exceeds Illinois's (74k) by roughly 150k and nearly 20k more tons. With these findings, I can see that both states overlap to some extent (as evident in four of the five commodities being the same) but due to the largely differing values and tonnage, both states clearly have a distinct industrial identity when analyzing the leading commodities.

### Transport Mode Patterns

<img width="633" height="462" alt="image" src="https://github.com/user-attachments/assets/565ae966-5223-48c6-abcc-74cb2d5f18a8" />

<img width="627" height="463" alt="image" src="https://github.com/user-attachments/assets/1c99d31d-9c46-4e68-b05c-f55ff4f1347a" />

Based on the chart, I can see that Trucking absolutely dominates every single top commodity by overwhelming margins. This is consistent with the fact that trucking provides a very versatile mode of transportation as it does not have limitations like water or railway or air and can freely use the roads to travel giving trucks the opportunity to have direct reach of different hubs, even states that aren't big in the logistics world (since roads are everywhere).

Though, more interestingly, I couldn't help but notice "Multiple modes & mail" place second in all commodities except Illinois's Pharmaceuticals and Mixed Freight. 

Multiple modes being notably present across all the commodities show that some shipments aren't simple enough (whether it is long distance or genuinely just complicated to ship out) to only have one mode of shipment which is consistent with the complex logistics infrastructure within Illinois and Michigan.

Though, one notable thing regarding my previous finding is that Illinois's pharmaceuticals have "air" as the second leading mode. This is consistent with one underlying reason being that pharmaceuticals are a lightweight commodity that allows for air transport. Another reason (and probably more notable) to add is that the US has an extensive air cargo network dozens of major hubs running thousands of weekly flights a lot of it centers around time-critical sectors like pharmaceuticals and electronics ([Source: Market Reports World](https://www.marketreportsworld.com/market-reports/air-freight-market-14722295)). Focusing on the last part, pharmaceuticals are reasonably time sensitive because hospitals, pharmacies, etc etc may experience shortages or may even run out of said commodity which in turn would make air a viable option for a high-value and time-sensitive commodity given that air transportation covers significantly more distance than trucking can within the same timeframe.

Another thing I noticed is that rail is third in total value in outbound motorized vehicles from Michigan but isn't really prominent that much elsewhere. A main underlying reason I can connect this finding to is that vehicles are a heavy commodity that requires to be transported over long distances which would most likely default to trucks or trains. Though, Illinois does not seem to produce much value from outbound motorized vehicles (through rail) compared to Michigan, this is most likely because Michigan has more specialized automotive manufacturing plants. This kind of dedicated automotive logistics infrastructure of Michigan, built specifically to move finished vehicles in large quantities likely explains why Michigan shows meaningful rail usage for motorized vehicles while Illinois, with a much smaller automotive manufacturing base, does not. ([Source: Industry Research](https://www.industryresearch.biz/market-reports/finished-vehicles-logistics-market-108297)). 

## What I'd Explore Next 

### Destination Analysis
How do both states interact with other states? Do they have strong trading partners? Do they skew towards a certain region or are their outbound freight somewhat evenly distributed?

This would give me an opportunity to see if Illinois's shipping destinations are consistent with its identity as a central trading hub. Also, I get to see how Michigan moves its top commodity (motorized vehicles) throughout the US and see what I can draw from that.

### Trade Type Analysis
How involved are Illinois and Michigan across the three trade types (Domestic being US to US, import being foreign to US, export being US to foreign)? What does this say about their identity in the logistics world? Does either state lean towards diversity or specialization?

With Illinois being closer to the center of the US while Michigan is closer to the US/Canada border, I would get an opportunity to see if either state skews more towards domestic or international trade.

## Tools Used
PostgreSQL, SQL, Power BI

Note: This project was completed with the assistance of Claude (Anthropic) as a learning and pair-programming tool. All queries, analytical decisions, and interpretations were reviewed, tested, and verified by me.

## Cloud Integration (v2 Update)

This project was extended to run on Azure, replacing the local 
PostgreSQL backend with a cloud-native pipeline:

**Architecture:** Blob Storage → Data Factory → Azure SQL Database → Power BI

**Notable adaptations:**
- T-SQL syntax differences from PostgreSQL (e.g. sp_rename vs. 
  ALTER TABLE RENAME, TOP vs. LIMIT)

**What stayed the same:** SQL views, window functions, and Power BI 
dashboard logic were carried over unchanged — only the underlying 
infrastructure changed.
