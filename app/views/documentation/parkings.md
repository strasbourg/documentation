# Coordonnées et disponibilité des parkings

    GET http://parkings.api.strasbourg-data.fr/parkings
<a class="btn" href="http://parkings.api.strasbourg-data.fr/parkings">tester</a>

## Reponse

    Status: 200 OK

```json
[
  {
    "id": 10,
    "name": "ZENITH",
    "short_name": "ZENITH",
    "latitude": 48.595890,
    "longitude": 7.686168,
    "state": 1,
    "total": 960,
    "available": 1,
    "user_information": "COMPLET"
  },
  {
    "id": 1,
    "name": "Bateliers",
    "short_name": "BATELIERS",
    "latitude": 48.581023,
    "longitude": 7.756072,
    "state": 2,
    "total": 3100,
    "available": 3087,
    "user_information": "FERME"
  },
  { … }
]
```