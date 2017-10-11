# findYourCompetitorsNearby

Input: Postal Codes, or address | Radius (km) | Search Keywords | Types (optional)
Output: a data frame of results displayed by the coordinates, and names.

Usage: Google Place API

Use case: finds restaurants nearby if you wanna open a pizza shop at young and dundas.
`` Input: 10 Dundas St E #402 | 5 | "pizza restaurant" | "food" ``
`` Output: a list of restaurants within the range

You can find a list of types provided by google [here](https://developers.google.com/places/web-service/supported_types). For more details about Google Place API please see [here](https://developers.google.com/places/web-service/)¸

Please find the main code in playground.R
- credits to answer from stokeoverflow answer to this question : "[Retrieve Location coordinates from google maps in R
](https://stackoverflow.com/questions/34800031/retrieve-location-coordinates-from-google-maps-in-r)"
