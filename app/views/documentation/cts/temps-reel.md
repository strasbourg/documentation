# Horaires en temps réel

    GET http://cts.api.strasbourg-data.fr/stops/:id/arrivals?time=TIMESTAMP

<a class="btn" href="http://cts.api.strasbourg-data.fr/stops/322/arrivals">tester</a>

## Reponse

    Status: 200 OK

```json
[
  {
    "mode": "Tram",
    "destination": "D Rotonde",
    "horaire": "2013-03-13T15:33:31+01:00",
    "est_apres_minuit":false
  },
  {
    "mode": "Tram",
    "destination": "A Lixenbuhl",
    "horaire": "2013-03-13T15:33:32+01:00",
    "est_apres_minuit":false
  },
  { … }
]
```